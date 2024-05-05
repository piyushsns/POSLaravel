<?php

namespace Webkul\RestApi\Http\Controllers\V1\Shop\Customer;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Str;
use Webkul\Checkout\Facades\Cart;
use Webkul\Payment\Facades\Payment;
use Webkul\RestApi\Http\Resources\V1\Shop\Checkout\CartResource;
use Webkul\RestApi\Http\Resources\V1\Shop\Checkout\CartShippingRateResource;
use Webkul\RestApi\Http\Resources\V1\Shop\Sales\OrderResource;
use Webkul\Sales\Repositories\OrderRepository;
use Webkul\Shipping\Facades\Shipping;

class CheckoutController extends CustomerController
{
    public function saveAddress(Request $request)
    {
        $address = $request->all();

        if (Cart::hasError()) {
            return new JsonResource([
                'redirect' => true,
                'data'     => route('shop.checkout.cart.index'),
            ]);
        }

        if (isset($address['billing'])) {
            Cart::updateOrCreateBillingAddress($address['billing']);
        }

        Cart::updateOrCreateShippingAddress($address['shipping'] ?? []);

        Cart::saveCustomerDetails();

        Cart::collectTotals();

        $rates = [];

        foreach (Shipping::getGroupedAllShippingRates() as $code => $shippingMethod) {
            $rates[] = [
                'carrier_title' => $shippingMethod['carrier_title'],
                'rates'         => CartShippingRateResource::collection(collect($shippingMethod['rates'])),
            ];
        }

        Cart::collectTotals();

        return response([
            'success' => true,
            'data'    => [
                'rates' => $rates,
                'cart'  => new CartResource(Cart::getCart()),
            ],
            'message' => trans('rest-api::app.shop.checkout.billing-address-saved'),
        ]);
    }

    /**
     * Save shipping method.
     *
     * @return \Illuminate\Http\Response
     */
    public function saveShipping(Request $request)
    {
        $shippingMethod = $request->get('shipping_method');

        if (Cart::hasError()
            || ! $shippingMethod
            || ! Cart::saveShippingMethod($shippingMethod)
        ) {
            abort(400);
        }

        Cart::collectTotals();

        return response([
            'success' => true,
            'data'    => [
                'methods' => Payment::getPaymentMethods(),
                'cart'    => new CartResource(Cart::getCart()),
            ],
            'message' => trans('rest-api::app.shop.checkout.shipping-method-saved'),
        ]);
    }

    /**
     * Save payment method.
     *
     * @return \Illuminate\Http\Response
     */
    public function savePayment(Request $request)
    {
        $payment = $request->get('payment');

        if (Cart::hasError() || ! $payment || ! Cart::savePaymentMethod($payment)) {
            abort(400);
        }

        return response([
            'success' => true,
            'data'    => [
                'cart' => new CartResource(Cart::getCart()),
            ],
            'message' => trans('rest-api::app.shop.checkout.payment-method-saved'),
        ]);
    }

    /**
     * Check for minimum order.
     *
     * @return \Illuminate\Http\Response
     */
    public function checkMinimumOrder()
    {
        $minimumOrderAmount = (float) core()->getConfigData('sales.orderSettings.minimum-order.minimum_order_amount') ?? 0;

        $status = Cart::checkMinimumOrder();

        return response([
            'success' => true,
            'data'    => [
                'cart'   => new CartResource(Cart::getCart()),
                'status' => ! $status ? false : true,
            ],
            'message' => ! $status ? trans('rest-api::app.shop.checkout.minimum-order-message', ['amount' => core()->currency($minimumOrderAmount)]) : 'Success',
        ]);
    }

    /**
     * Save order.
     *
     * @return \Illuminate\Http\Response
     */
    public function saveOrder(OrderRepository $orderRepository)
    {
        if (Cart::hasError()) {
            abort(400);
        }

        Cart::collectTotals();

        $this->validateOrder();

        $cart = Cart::getCart();

        if ($redirectUrl = Payment::getRedirectUrl($cart)) {
            return response([
                'redirect_url' => $redirectUrl,
            ]);
        }

        $order = $orderRepository->create(Cart::prepareDataForOrder());

        Cart::deActivateCart();

        return response([
            'success' => true,
            'data'    => [
                'order' => new OrderResource($order),
            ],
            'message' => trans('rest-api::app.shop.checkout.order-saved'),
        ]);
    }

    /**
     * Validate order before creation.
     *
     * @return void|\Exception
     */
    protected function validateOrder()
    {
        $cart = Cart::getCart();

        $minimumOrderAmount = core()->getConfigData('sales.orderSettings.minimum-order.minimum_order_amount') ?? 0;

        if (! $cart->checkMinimumOrder()) {
            throw new \Exception(trans('rest-api::app.shop.checkout.minimum-order-message', ['amount' => core()->currency($minimumOrderAmount)]));
        }

        if ($cart->haveStockableItems() && ! $cart->shipping_address) {
            throw new \Exception(trans('rest-api::app.shop.checkout.check-shipping-address'));
        }

        if (! $cart->billing_address) {
            throw new \Exception(trans('rest-api::app.shop.checkout.check-billing-address'));
        }

        if ($cart->haveStockableItems() && ! $cart->selected_shipping_rate) {
            throw new \Exception(trans('rest-api::app.shop.checkout.specify-shipping-method'));
        }

        if (! $cart->payment) {
            throw new \Exception(trans('rest-api::app.shop.checkout.specify-payment-method'));
        }
    }
}
