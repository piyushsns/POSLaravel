<?php

namespace Webkul\RestApi\Http\Resources\V1\Shop\Catalog;

use Illuminate\Http\Resources\Json\JsonResource;
use Webkul\Attribute\Models\AttributeOption;
use Webkul\Checkout\Facades\Cart;
use Webkul\Product\Helpers\BundleOption;

class ConfigurationProductResource extends JsonResource
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
        $totalStock = 0;
        $salesTotalPrice = 0;
        $regularTotalPrice = 0;

        $images = ConfigurableProductImageResource::collection($product->images)->toArray($request);
        $videos = ProductVideoResource::collection($product->videos)->toArray($request);
        $tags = [];

        $product->variants->map(function($variant) use (&$tags,&$totalStock,$request,&$images,&$videos,&$productTypeInstance,&$salesTotalPrice,&$regularTotalPrice) {
            $totalStock += $variant->totalQuantity();
            // Merge the images of the current variant into the main images array
            // $images = array_merge($images, SimpleProductImageResource::collection($variant->images)->toArray($request));
            // $videos = array_merge($videos, ProductVideoResource::collection($variant->videos)->toArray($request));
            $salesTotalPrice += core()->convertPrice($variant->getTypeInstance()->getMinimalPrice());
            $regularTotalPrice += data_get($variant->getTypeInstance()->getProductPrices(), 'regular.price');
            // if ($model1 = AttributeOption::find(($variant->getAttributeWthValue("color")))) {
            //     $tags[] = $model1->admin_name;
            // }
            // if ($model2 = AttributeOption::find(($variant->getAttributeWthValue("design")))) {
            //     $tags[] = $model2->admin_name;
            // }
            // if ($model3 = AttributeOption::find(($variant->getAttributeWthValue("size")))) {
            //     $tags[] = $model3->admin_name;
            // }
            return $totalStock;
        });

        $categories = $product->categories->pluck('slug');
        $categoryname = count($categories)>0 ? str_replace("-","_",$categories[0]):'all';


        $brand = "";
        $collection = [];
        if ($brandModel = AttributeOption::find(($product->getAttributeWthValue("brand")))) {
            $brand = $brandModel->admin_name;
        }
        if ($product->new==1) {
            $collection[] = "new products";
        }
        if ($product->featured==1) {
            $collection[] = "featured products";
        }
        $product_repository = app(\Webkul\Product\Repositories\ProductRepository::class)->findOrFail($product->id);
        $configurableConfig = app(\Webkul\Product\Helpers\ConfigurableOption::class)->getCustomAPIConfigurationConfig($product_repository);
        $additionalInformation = app(\Webkul\Product\Helpers\View::class)->getAdditionalData($product_repository);
        /* generating resource */
        return [
            /* product's information */
            'id'                  => $product->id,
            'sku'                 => $product->sku,
            'product_type'        => $product->type,
            'type'                => $categoryname,
            'title'               => $product->name,
            'url_key'             => $product->url_key,
            'collection'          => $collection,
            'brand'               => $brand,
            'new'                 => $product->new?true:false,
            'featured'            => $product->featured?true:false,
            'special'             => $product->getAttributeWthValue('special')?true:false,
            'newarrival'          => $product->getAttributeWthValue('newarrival')?true:false,
            'trending'            => $product->getAttributeWthValue('trending')?true:false,
            "stock"               => $totalStock,
            "sale"                => $totalStock>0,
            "tags"                => array_unique($tags),
            "discount"            => $regularTotalPrice - $salesTotalPrice,
            'price'               => core()->convertPrice($productTypeInstance->getMinimalPrice()),
            'min_price'           => core()->convertPrice($productTypeInstance->getMinimalPrice()),
            'max_price'           => core()->convertPrice($productTypeInstance->getMaximumPrice()),
            'formatted_min_price' => core()->currency($productTypeInstance->getMinimalPrice()),
            'formatted_max_price' => core()->currency($productTypeInstance->getMaximumPrice()),
            'short_description'   => $product->short_description,
            'description'         => $product->description,
            'images'              => $images,
            'videos'              => $videos,
            /* product's categories */
            'variants' => SimpleProductResource::collection($product->variants),
            /* product's categories */
            'category'         => $categoryname,
            /* product's reviews */
            'reviews' => [
                'total'          => $total = $this->productReviewHelper->getTotalReviews($product),
                'total_rating'   => $total ? $this->productReviewHelper->getTotalRating($product) : 0,
                'average_rating' => $total ? $this->productReviewHelper->getAverageRating($product) : 0,
                'percentage'     => $total ? json_encode($this->productReviewHelper->getPercentageRating($product)) : [],
            ],
            /* product's checks */
            'in_stock'            => $product->haveSufficientQuantity(1),
            'is_saved'            => false,
            'is_item_in_cart'     => Cart::hasProduct($product),
            'created_at'          => $product->created_at,
            'updated_at'          => $product->updated_at,
            $this->merge($configurableConfig),
            "specifications"       => $additionalInformation
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

        return [
            'special_price'           => $this->when(
                $productTypeInstance->haveDiscount(),
                core()->convertPrice($productTypeInstance->getMinimalPrice())
            ),
            'formatted_special_price' => $this->when(
                $productTypeInstance->haveDiscount(),
                core()->currency($productTypeInstance->getMinimalPrice())
            ),
            'regular_price'           => $this->when(
                $productTypeInstance->haveDiscount(),
                data_get($productTypeInstance->getProductPrices(), 'regular_price.price')
            ),
            'formatted_regular_price' => $this->when(
                $productTypeInstance->haveDiscount(),
                data_get($productTypeInstance->getProductPrices(), 'regular_price.formated_price')
            ),
        ];
    }

    /**
     * Get all product's extra information.
     *
     * @return array
     */
    private function allProductExtraInfo()
    {
        $product = $this->product ? $this->product : $this;

        $productTypeInstance = $product->getTypeInstance();

        return [
            /* grouped product */
            $this->mergeWhen(
                $productTypeInstance instanceof \Webkul\Product\Type\Grouped,
                $product->type == 'grouped'
                    ? $this->getGroupedProductInfo($product)
                    : null
            ),

            /* bundle product */
            $this->mergeWhen(
                $productTypeInstance instanceof \Webkul\Product\Type\Bundle,
                $product->type == 'bundle'
                    ? $this->getBundleProductInfo($product)
                    : null
            ),

            /* configurable product */
            $this->mergeWhen(
                $productTypeInstance instanceof \Webkul\Product\Type\Configurable,
                $product->type == 'configurable'
                    ? $this->getConfigurableProductInfo($product)
                    : null
            ),

            /* downloadable product */
            $this->mergeWhen(
                $productTypeInstance instanceof \Webkul\Product\Type\Downloadable,
                $product->type == 'downloadable'
                    ? $this->getDownloadableProductInfo($product)
                    : null
            ),
        ];
    }

    /**
     * Get grouped product's extra information.
     *
     * @param  \Webkul\Product\Models\Product  $product
     * @return array
     */
    private function getGroupedProductInfo($product)
    {
        return [
            'grouped_products' => $product->grouped_products->map(function ($groupedProduct) {
                $associatedProduct = $groupedProduct->associated_product;

                $data = $associatedProduct->toArray();

                return array_merge($data, [
                    'qty'                   => $groupedProduct->qty,
                    'isSaleable'            => $associatedProduct->getTypeInstance()->isSaleable(),
                    'formatted_price'       => $associatedProduct->getTypeInstance()->getPriceHtml(),
                    'show_quantity_changer' => $associatedProduct->getTypeInstance()->showQuantityBox(),
                ]);
            }),
        ];
    }

    /**
     * Get bundle product's extra information.
     *
     * @param  \Webkul\Product\Models\Product  $product
     * @return array
     */
    private function getBundleProductInfo($product)
    {
        return [
            'bundle_options' => app(BundleOption::class)->getBundleConfig($product),
        ];
    }

    /**
     * Get configurable product's extra information.
     *
     * @param  \Webkul\Product\Models\Product  $product
     * @return array
     */
    private function getConfigurableProductInfo($product)
    {
        return [
            'variants' => ProductResource::collection($product->variants),
        ];
    }

    /**
     * Get downloadable product's extra information.
     *
     * @param  \Webkul\Product\Models\Product  $product
     * @return array
     */
    private function getDownloadableProductInfo($product)
    {
        return [
            'downloadable_links' => $product->downloadable_links->map(function ($downloadableLink) {
                $data = $downloadableLink->toArray();

                if (isset($data['sample_file'])) {
                    $data['price'] = core()->currency($downloadableLink->price);
                    $data['sample_download_url'] = route('shop.downloadable.download_sample', ['type' => 'link', 'id' => $downloadableLink['id']]);
                }

                return $data;
            }),

            'downloadable_samples' => $product->downloadable_samples->map(function ($downloadableSample) {
                $sample = $downloadableSample->toArray();
                $data = $sample;
                $data['download_url'] = route('shop.downloadable.download_sample', ['type' => 'sample', 'id' => $sample['id']]);

                return $data;
            }),
        ];
    }
}
