<?php

namespace Webkul\RestApi\Http\Controllers\V1\Shop\Customer;

use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful;
use Webkul\Core\Rules\AlphaNumericSpace;
use Webkul\Core\Rules\PhoneNumber;
use Webkul\Customer\Repositories\CustomerGroupRepository;
use Webkul\Customer\Repositories\CustomerRepository;
use Webkul\RestApi\Http\Resources\V1\Shop\Customer\CustomerResource;

class AuthController extends CustomerController
{
    use SendsPasswordResetEmails;

    /**
     * Controller instance.
     *
     * @return void
     */
    public function __construct(
        protected CustomerRepository $customerRepository,
        protected CustomerGroupRepository $customerGroupRepository
    ) {
        parent::__construct();
    }

    /**
     * Register the customer.
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {

        $validation = Validator::make($request->all(), [
            'first_name'            => ['required', new AlphaNumericSpace],
            'last_name'             => ['required', new AlphaNumericSpace],
            'email'                 => 'required|email|unique:customers,email',
            'password'              => 'required|confirmed|min:6',
            'password_confirmation' => 'required',
        ]);

        if($validation->fails()) {
            return response()->json([
                "success" => false,
                "message" => "Validation Errors",
                'validation_errors' => $validation->errors()
            ], 422);
        }

        Event::dispatch('customer.registration.before');

        $customer = $this->customerRepository->create([
            'first_name'        => $request->first_name,
            'last_name'         => $request->last_name,
            'email'             => $request->email,
            'password'          => bcrypt($request->password),
            'is_verified'       => 1,
            'channel_id'        => core()->getCurrentChannel()->id,
            'customer_group_id' => $this->customerGroupRepository->findOneWhere(['code' => 'general'])->id,
        ]);

        Event::dispatch('customer.registration.after', $customer);

        return response()->json([
            "success" => true,
            'message' => trans('rest-api::app.shop.customer.accounts.create-success'),
            'data' => new CustomerResource($customer),
        ], 201);
    }

    /**
     * Login the customer.
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        if (! EnsureFrontendRequestsAreStateful::fromFrontend($request)) {
            $input = $request->all();
            $validation = Validator::make($input, [
                'email'    => 'required|email',
                'password' => 'required',
                'device_name' => 'required',
            ]);
            if($validation->fails()) {
                return response()->json([
                    "success" => false,
                    "message" => "Validation Errors",
                    'validation_errors' => $validation->errors()
                ], 422);
            }
            $customer = $this->customerRepository->where('email', $request->email)->first();
            if (! $customer || ! Hash::check($request->password, $customer->password)) {
                return response()->json([
                    "success" => false,
                    "message" => trans('rest-api::app.shop.customer.accounts.error.credential-error'),
                ], 422);
            }
            /**
             * Preventing multiple token creation.
             */
            $customer->tokens()->delete();

            /**
             * Event passed to prepare cart after login.
             */
            Event::dispatch('customer.after.login', $request->get('email'));
            $new_token = $customer->createToken($request->device_name, ['role:customer'])->plainTextToken;
            return response()->json([
                "success" => true,
                'message' => trans('rest-api::app.shop.customer.accounts.logged-in-success'),
                'data' => new CustomerResource($customer),
                'token' => explode("|", $new_token)[1],
                "token_type" => "bearer",
            ], 200);

        }

        if (Auth::attempt($request->only(['email', 'password']))) {
            $request->session()->regenerate();

            return response([
                'success' => true,
                'data'    => new CustomerResource($this->resolveShopUser($request)),
                'message' => trans('rest-api::app.shop.customer.accounts.logged-in-success'),
            ]);
        }

        return response([
            'success' => false,
            'message' => trans('rest-api::app.shop.customer.accounts.error.invalid'),
        ], 401);
    }

    /**
     * Get details for current logged in customer.
     *
     * @return \Illuminate\Http\Response
     */
    public function get(Request $request)
    {
        $customer = $this->resolveShopUser($request);
        return response([
            'success' => true,
            'data' => new CustomerResource($customer),
        ]);
    }

    /**
     * Update the customer.
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $customer = $this->resolveShopUser($request);

        $data = $request->all();

        $validation = Validator::make($request->all(), [
            'first_name'    => ['required', new AlphaNumericSpace],
            'last_name'     => ['required', new AlphaNumericSpace],
            'gender'        => 'required',
            'date_of_birth' => 'nullable|date|before:today',
            'email'         => 'email|unique:customers,email,'.$customer->id,
            'phone'         => ['required', new PhoneNumber],
            'password'      => 'confirmed|min:6',
        ]);

        if($validation->fails()) {
            return response()->json([
                "success" => false,
                "message" => "Validation Errors",
                'validation_errors' => $validation->errors()
            ], 422);
        }

        if (! isset($data['password']) || ! $data['password']) {
            unset($data['password']);
        } else {
            $data['password'] = bcrypt($data['password']);
        }

        $updatedCustomer = $this->customerRepository->update($data, $customer->id);

        return response([
            'success' => true,
            'data'    => new CustomerResource($updatedCustomer),
            'message' => trans('rest-api::app.shop.customer.addresses.update-success'),
        ]);
    }

    /**
     * Logout the customer.
     *
     * @return \Illuminate\Http\Response
     */
    public function logout(Request $request)
    {
        $customer = $this->resolveShopUser($request);
        ! EnsureFrontendRequestsAreStateful::fromFrontend($request)
            ? $customer->tokens()->delete()
            : auth()->guard('customer')->logout();
        Event::dispatch('customer.after.logout', $customer->id);
        return response([
            'success' => true,
            'message' => trans('rest-api::app.shop.customer.accounts.logged-in-success'),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function forgotPassword(Request $request)
    {

        $validation = Validator::make($request->all(), [
            'email' => 'required|email',
        ]);

        if($validation->fails()) {
            return response()->json([
                "success" => false,
                "message" => "Validation Errors",
                'validation_errors' => $validation->errors()
            ], 422);
        }

        $response = Password::broker('customers')->sendResetLink($request->only(['email']));

        return response([
            'success' => true,
            'message' => __($response)
        ], $response == Password::RESET_LINK_SENT ? 200 : 400);
    }
}
