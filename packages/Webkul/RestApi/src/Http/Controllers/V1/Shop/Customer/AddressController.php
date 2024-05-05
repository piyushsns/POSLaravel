<?php

namespace Webkul\RestApi\Http\Controllers\V1\Shop\Customer;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Validator;
use Webkul\Core\Rules\AlphaNumericSpace;
use Webkul\Core\Rules\PhoneNumber;
use Webkul\Customer\Repositories\CustomerAddressRepository;
use Webkul\RestApi\Http\Resources\V1\Shop\Customer\CustomerAddressResource;
use Webkul\Shop\Http\Requests\Customer\AddressRequest;
use Webkul\Core\Rules\Address;
use Webkul\Customer\Rules\VatIdRule;

class AddressController extends CustomerController
{
    /**
     * Repository class name.
     *
     * @return string
     */
    public function repository()
    {
        return CustomerAddressRepository::class;
    }

    /**
     * Resource class name.
     *
     * @return string
     */
    public function resource()
    {
        return CustomerAddressResource::class;
    }

    public function getAll(Request $request) {
        $customer = $this->resolveShopUser($request);
        $customerAddress = $customer->addresses;
        return response([
            'success' => true,
            'data'    => $customerAddress,
        ]);
    }
    
    public function get(Request $request, $id) {
        $customer = $this->resolveShopUser($request);
        $customerAddress = $customer->addresses()->findOrFail($id);
        return response([
            'success' => true,
            'data'    => new CustomerAddressResource($customerAddress),
        ]);
    }

    /**
     * Store address.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
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

        Event::dispatch('customer.addresses.create.before');

        $data = array_merge($request->only([
            'company_name',
            'first_name',
            'last_name',
            'vat_id',
            'address1',
            'country',
            'state',
            'city',
            'postcode',
            'phone',
            'default_address',
        ]), [
            'customer_id' => $customer->id,
            'address1'    => implode(PHP_EOL, array_filter($request->input('address1'))),
            'address2'    => implode(PHP_EOL, array_filter($request->input('address2', []))),
        ]);

        $customerAddress = $this->getRepositoryInstance()->create($data);

        Event::dispatch('customer.addresses.create.after', $customerAddress);

        return response([
            'success' => true,
            'data'    => new CustomerAddressResource($customerAddress),
            'message' => trans('rest-api::app.shop.customer.addresses.create-success'),
        ]);
    }

    /**
     * Update address.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, int $id)
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

        $data = array_merge(request()->only([
            'customer_id',
            'company_name',
            'vat_id',
            'first_name',
            'last_name',
            'address1',
            'city',
            'country',
            'state',
            'postcode',
            'phone',
            'default_address',
        ]), [
            'address1' => implode(PHP_EOL, array_filter(request()->input('address1'))),
            'address2' => implode(PHP_EOL, array_filter(request()->input('address2', []))),
        ]);

        Event::dispatch('customer.addresses.update.before', $id);

        $customerAddress = $customer->addresses()->findOrFail($id);

        $customerAddress->update($data);

        Event::dispatch('customer.addresses.update.after', $customerAddress);

        return response([
            'success' => true,
            'data'    => new CustomerAddressResource($customerAddress),
            'message' => trans('rest-api::app.shop.customer.addresses.update-success'),
        ]);
    }

    /**
     * Delete customer address.
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, int $id)
    {
        $customer = $this->resolveShopUser($request);

        Event::dispatch('customer.addresses.delete.before', $id);

        $customerAddress = $customer->addresses()->findOrFail($id);

        $customerAddress->delete();

        Event::dispatch('customer.addresses.delete.after', $id);

        return response([
            'success' => true,
            'message' => trans('rest-api::app.shop.customer.addresses.delete-success'),
        ]);
    }
}
