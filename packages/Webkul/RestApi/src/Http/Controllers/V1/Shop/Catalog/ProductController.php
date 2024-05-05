<?php

namespace Webkul\RestApi\Http\Controllers\V1\Shop\Catalog;

use Illuminate\Http\Request;
use Webkul\Product\Models\Product;
use Illuminate\Support\Facades\DB;
use Webkul\Attribute\Repositories\AttributeRepository;
use Webkul\Customer\Repositories\CustomerRepository;
use Webkul\Marketing\Repositories\SearchSynonymRepository;
use Webkul\Product\Repositories\ElasticSearchRepository;
use Webkul\Product\Repositories\ProductAttributeValueRepository;
use Webkul\Product\Repositories\ProductRepository;
use Webkul\RestApi\Http\Resources\V1\Shop\Catalog\ConfigurationProductResource;
use Webkul\RestApi\Http\Resources\V1\Shop\Catalog\ProductResource;
use Webkul\RestApi\Http\Resources\V1\Shop\Catalog\SimpleProductResource;

class ProductController extends CatalogController
{

    public function __construct(
        protected CustomerRepository $customerRepository,
        protected AttributeRepository $attributeRepository,
        protected ProductAttributeValueRepository $productAttributeValueRepository,
        protected ElasticSearchRepository $elasticSearchRepository,
        protected SearchSynonymRepository $searchSynonymRepository,
    ) {
        parent::__construct();
    }

    public function isAuthorized()
    {
        return false;
    }

    public function repository()
    {
        return ProductRepository::class;
    }

    public function resource()
    {
        return ProductResource::class;
    }

    public function allResources(Request $request)
    {
        return $this->searchFromDatabase();
    }

    public function getResource(Request $request, $id)
    {
        $resource = $this->getRepositoryInstance()->findOrFail($id);
        return new ConfigurationProductResource($resource);
    }

    public function additionalInformation(Request $request, $id)
    {
        $resource = $this->getRepositoryInstance()->findOrFail($id);
        $additionalInformation = app(\Webkul\Product\Helpers\View::class)->getAdditionalData($resource);
        return response([
            "success" => true,
            'data' => $additionalInformation,
        ]);
    }

    public function configurableConfig(Request $request, $id)
    {
        $resource = $this->getRepositoryInstance()->findOrFail($id);

        $configurableConfig = app(\Webkul\Product\Helpers\ConfigurableOption::class)
            ->getConfigurationConfig($resource);

        return response([
            "success" => true,
            'data' => $configurableConfig,
        ]);
    }

    public function searchFromDatabase()
    {
        $repository = $this->getRepositoryInstance();
        $params = array_merge([
            'status'               => 1,
            'visible_individually' => 1,
            'url_key'              => null,
        ], request()->input());

        if (! empty($params['query'])) {
            $params['name'] = $params['query'];
        }

        $query = $repository->with([
            "categories",
            "attribute_values",
            "attribute_values.attribute",
            'attribute_family',
            'images',
            'videos',
            'attribute_values',
            'price_indices',
            'inventory_indices',
            'reviews'])->select('configurables.*')
        ->from('products as configurables')
        ->distinct()
        ->join('products as variants', function ($join) {$join->on('variants.parent_id', '=', 'configurables.id')->where('variants.type', '=', 'simple');})
        ->leftJoin('product_price_indices', function ($join) {
            $join->on('configurables.id', '=', 'product_price_indices.product_id')->where('product_price_indices.customer_group_id', '=', 1);
        })->leftJoin('product_categories', 'configurables.id', '=', 'product_categories.product_id')
            ->where('configurables.type', '=', 'configurable');

        // Additional joins and filters

        // Filter by categories if provided
        if (empty($params['sub_category_id']) && !empty($params['category_id'])) {
            $query->whereIn('product_categories.category_id', explode(',', $params['category_id']));
        }
        if (!empty($params['sub_category_id'])) {
            $query->whereIn('product_categories.category_id', explode(',', $params['sub_category_id']));
        }

        // Apply attribute filters
        $filterableAttributes = $this->attributeRepository->getProductDefaultAttributes(array_keys($params));

        /**
        * Filter the required attributes.
        */
        $attributes = $filterableAttributes->whereIn('code', [
            'name',
            'status',
            'url_key',
            'visible_individually',
        ]);

        /**
        * Filter collection by required attributes.
        */
        foreach ($attributes as $attribute) {
            $alias = $attribute->code.'_product_attribute_values';
            $query->leftJoin('product_attribute_values as '.$alias, 'configurables.id', '=', $alias.'.product_id')
            ->where($alias.'.attribute_id', $attribute->id);
            if ($attribute->code == 'name') {
                $synonyms = $this->searchSynonymRepository->getSynonymsByQuery(urldecode($params['name']));
                $query->where(function ($subQuery) use ($alias, $synonyms) {
                    foreach ($synonyms as $synonym) {
                        $subQuery->orWhere($alias.'.text_value', 'like', '%'.$synonym.'%');
                    }
                });
            } elseif ($attribute->code == 'url_key') {
                if (empty($params['url_key'])) {
                    $query->whereNotNull($alias.'.text_value');
                } else {
                    $query->where($alias.'.text_value', 'like', '%'.urldecode($params['url_key']).'%');
                }
            } else {
                if (is_null($params[$attribute->code])) {
                    continue;
                }

                $query->where($alias.'.'.$attribute->column_name, 1);
            }
        }

        /**
        * Filter the filterable attributes.
        */
        $attributes = $filterableAttributes->whereNotIn('code', ['name','status','visible_individually','url_key']);

        /**
        * Filter query by attributes.
        */
        foreach ($attributes as $attribute) {
            if (!empty($params[$attribute->code])) {
                $values = explode(',', $params[$attribute->code]);
                $alias = $attribute->code.'_product_attribute_values';
                $query->leftJoin('product_attribute_values as '.$alias, 'variants.id', '=', $alias.'.product_id')
                ->where($alias.'.attribute_id', $attribute->id);
                if ($attribute->type == 'price') {
                    $query->whereBetween($alias.'.'.$attribute->column_name, [
                        core()->convertToBasePrice(current($values)),
                        core()->convertToBasePrice(end($values)),
                    ]);
                } else {
                    $query->whereIn($alias.'.'.$attribute->column_name, $values);
                }
            }
        }

        /**
        * Sort collection.
        */
        $sortOptions = $repository->getSortOptions($params);
        if ($sortOptions['order'] != 'rand') {
            $attribute = $this->attributeRepository->findOneByField('code', $sortOptions['sort']);
            if ($attribute) {
                if ($attribute->code === 'price') {
                    $query->orderBy('product_price_indices.min_price', $sortOptions['order']);
                } else {
                    $alias = 'sort_product_attribute_values';
                    $query->leftJoin('product_attribute_values as '.$alias, function ($join) use ($alias, $attribute) {
                    $join->on('variants.id', '=', $alias.'.product_id')
                        ->where($alias.'.attribute_id', $attribute->id)
                        ->where($alias.'.channel', core()->getRequestedChannelCode())
                        ->where($alias.'.locale', core()->getRequestedLocaleCode());
                    })->orderBy($alias.'.'.$attribute->column_name, $sortOptions['order']);
                }
            } else {
                $query->orderBy('variants.created_at', $sortOptions['order']);
            }
        }

        $query = $query->groupBy('configurables.id');
        $limit = $repository->getPerPageLimit($params);
        return SimpleProductResource::collection($this->getRepositoryInstance()->getAll());
    }
}
