<?php

namespace Webkul\RestApi\Http\Resources\V1\Shop\Catalog;

use Illuminate\Http\Resources\Json\JsonResource;
use Webkul\Attribute\Models\AttributeOption;

class SimpleProductResource extends JsonResource
{
    /**
     * Product review helper.
     *
     * @var \Webkul\Product\Helpers\Review
     */
    protected $productReviewHelper;

    /**
     * Create a new resource instance.
     *
     * @return void
     */
    public function __construct($resource)
    {
        $this->productReviewHelper = app(\Webkul\Product\Helpers\Review::class);

        parent::__construct($resource);
    }

    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        /* assign product */
        $product = $this->product ? $this->product : $this;

        /* get type instance */
        $productTypeInstance = $product->getTypeInstance();

        $size="";
        $color="";
        $design = "";
        $color_code = "";
        if ($model1 = AttributeOption::find(($product->getAttributeWthValue("size")))) {
            $size = $model1->admin_name;
        }
        if ($model2 = AttributeOption::find(($product->getAttributeWthValue("color")))) {
            $color = $model2->admin_name;
            $color_code = $model2->swatch_value;
        }
        if ($model3 = AttributeOption::find(($product->getAttributeWthValue("design")))) {
            $design = $model3->admin_name;
        }

        /* generating resource */
        return [
            /* product's information */
            'id'                 => $product->id,
            'variant_id'         => $product->id,
            'sku'                => $product->sku,
            'title'              => $product->name,
            'url_key'            => $product->url_key,
            'size'               => $size,
            'color'              => $color,
            'color_code'         => $color_code,
            'design'             => $design,
            'price'              => core()->convertPrice($productTypeInstance->getMinimalPrice()),
            'formatted_price'    => core()->currency($productTypeInstance->getMinimalPrice()),
            'description'        => $product->description,
            'short_description'  => $product->short_description,
            'images'             => SimpleProductImageResource::collection($product->images),
            'videos'             => ProductVideoResource::collection($product->videos),
            $this->merge($this->specialPriceInfo()),
        ];
    }

        /**
     * Get special price information.
     *
     * @return array
     */
    private function specialPriceInfo()
    {
        $product = $this->product ? $this->product : $this;

        $productTypeInstance = $product->getTypeInstance();

        // return [
        //     'special_price'           => $this->when(
        //         $productTypeInstance->haveDiscount(),
        //         core()->convertPrice($productTypeInstance->getMinimalPrice())
        //     ),
        //     'formatted_special_price' => $this->when(
        //         $productTypeInstance->haveDiscount(),
        //         core()->currency($productTypeInstance->getMinimalPrice())
        //     ),
        //     'regular_price'           => $this->when(
        //         $productTypeInstance->haveDiscount(),
        //         data_get($productTypeInstance->getProductPrices(), 'regular.price')
        //     ),
        //     'formatted_regular_price' => $this->when(
        //         $productTypeInstance->haveDiscount(),
        //         data_get($productTypeInstance->getProductPrices(), 'regular.formatted_price')
        //     ),
        // ];
        return [
            'hasDiscount'             => $productTypeInstance->haveDiscount(),
            'special_price'           => core()->convertPrice($productTypeInstance->getMinimalPrice()),
            'formatted_special_price' => core()->currency($productTypeInstance->getMinimalPrice()),
            'regular_price'           => data_get($productTypeInstance->getProductPrices(), 'regular.price'),
            'formatted_regular_price' => data_get($productTypeInstance->getProductPrices(), 'regular.formatted_price')
        ];
    }
}
