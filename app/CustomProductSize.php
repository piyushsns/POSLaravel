<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Webkul\Customer\Models\Customer;
use Webkul\Product\Models\ProductFlat;

class CustomProductSize extends Model
{
    use HasFactory;

    protected $guarded = [];

    /**
     * Get the product_flat associated with the LiveDemoAppointment
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function product_flat()
    {
        return $this->hasOne(ProductFlat::class, 'product_id', 'product_id');
    }

    /**
     * Get the customer that owns the LiveDemoAppointment
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }
}
