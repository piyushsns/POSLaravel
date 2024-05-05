<?php

namespace Webkul\RestApi\Http\Resources\V1\Shop\Catalog;

use Webkul\RestApi\Http\Resources\V1\Admin\Catalog\ProductImageResource as AdminProductImageResource;

class ConfigurableProductImageResource extends AdminProductImageResource
{
        /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'                 => $this->id,
            'image_id'           => $this->id,
            'path'               => $this->path,
            'src'                => $this->url,
            'original_image_url' => $this->url,
            'small_image_url'    => url('cache/small/'.$this->path),
            'medium_image_url'   => url('cache/medium/'.$this->path),
            'large_image_url'    => url('cache/large/'.$this->path),
        ];
    }
}
