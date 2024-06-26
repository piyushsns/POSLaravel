<?php

namespace Webkul\RestApi\Http\Controllers\V1\Shop\Customer;

use Illuminate\Http\Request;
use Webkul\Checkout\Facades\Cart;
use Webkul\Customer\Repositories\WishlistRepository;
use Webkul\Product\Repositories\ProductRepository;
use Webkul\RestApi\Http\Resources\V1\Shop\Checkout\CartResource;
use Webkul\RestApi\Http\Resources\V1\Shop\Customer\CustomerWishlistResource;

class WishlistController extends CustomerController
{
    /**
     * Create a new controller istance.
     */
    public function __construct(
        protected WishlistRepository $wishlistRepository,
        protected ProductRepository $productRepository
    ) {
        parent::__construct();
    }

    /**
     * Get customer wishlist.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $customer = $this->resolveShopUser($request);

        return response([
            'success' => true,
            'data' => CustomerWishlistResource::collection($customer->wishlist_items()->get()),
        ]);
    }

    /**
     * Add or remote item from wishlist.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function addOrRemove(Request $request, $id)
    {
        $customer = $this->resolveShopUser($request);

        $wishlistItem = $this->wishlistRepository->findOneWhere([
            'channel_id'  => core()->getCurrentChannel()->id,
            'product_id'  => $id,
            'customer_id' => $customer->id,
        ]);

        if ($wishlistItem) {
            $this->wishlistRepository->delete($wishlistItem->id);

            return response([
                'success' => true,
                'data'    => CustomerWishlistResource::collection($customer->wishlist_items()->get()),
                'message' => trans('rest-api::app.shop.wishlist.removed'),
            ]);
        }

        $wishlistItem = $this->wishlistRepository->create([
            'channel_id'  => core()->getCurrentChannel()->id,
            'product_id'  => $id,
            'customer_id' => $customer->id,
            'additional'  => $request->input('additional') ?? null,
        ]);

        return response([
            'success' => true,
            'data'    => new CustomerWishlistResource($wishlistItem),
            'message' => trans('rest-api::app.shop.wishlist.success'),
        ]);
    }

    /**
     * Move product from wishlist to cart.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function moveToCart(Request $request, $id)
    {
        $customer = $this->resolveShopUser($request);

        $wishlistItem = $this->wishlistRepository->findOneWhere([
            'channel_id'  => core()->getCurrentChannel()->id,
            'product_id'  => $id,
            'customer_id' => $customer->id,
        ]);

        if (! $wishlistItem) {
            return response([
                'success' => false,
                'message' => trans('rest-api::app.shop.wishlist.error.mass-operations.resource-not-found'),
            ], 200);
        }

        if ($wishlistItem->customer_id != $customer->id) {
            return response([
                'success' => false,
                'message' => trans('rest-api::app.shop.wishlist.error.security-warning'),
            ], 200);
        }

        $result = Cart::moveToCart($wishlistItem);

        if ($result) {
            Cart::collectTotals();

            $cart = Cart::getCart();

            return response([
                'success' => true,
                'data'    => $cart ? new CartResource($cart) : null,
                'message' => trans('rest-api::app.shop.wishlist.moved'),
            ]);
        }

        return response([
            'success' => false,
            'message' => trans('rest-api::app.shop.wishlist.option-missing'),
        ], 200);
    }
}
