<?php

namespace Webkul\Shop\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CartItemResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'quantity' => $this->quantity,
            'type' => $this->type,
            'name' => $this->name,
            'price' => $this->price,
            'weight' => $this->weight,
            'formatted_price' => core()->formatPrice($this->price),
            'total' => $this->total,
            'formatted_total' => core()->formatPrice($this->total),
            'options' => array_values($this->resource->additional['attributes'] ?? []),
            'base_image' => $this->getTypeInstance()->getBaseImage($this),
            'product_url_key' => $this->product->url_key,
            'product_id' => $this->product_id,
            'purity' => $this->product->purity,
            'making_charges_amount' => $this->making_charges_amount,
            'base_making_charges_amount' => $this->base_making_charges_amount,
            'other_amount' => $this->other_amount,
            'base_other_amount' => $this->base_other_amount,
            'total_weight' => $this->total_weight,
            'base_total_weight' => $this->base_total_weight,
            'cgst_amount' => $this->cgst_amount,
            'base_cgst_amount' => $this->base_cgst_amount,
            'sgst_amount' => $this->sgst_amount,
            'base_sgst_amount' => $this->base_sgst_amount,
        ];
    }
}
