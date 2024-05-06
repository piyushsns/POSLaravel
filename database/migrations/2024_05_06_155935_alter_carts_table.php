<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('cart', function (Blueprint $table) {

            $table->decimal('base_making_charges_amount', 12, 4)->default(0)->nullable();
            $table->decimal('making_charges_amount', 12, 4)->default(0)->nullable();

            $table->decimal('other_amount', 12, 4)->default(0)->nullable();
            $table->decimal('base_other_amount', 12, 4)->default(0)->nullable();
        });
        Schema::table('cart_items', function (Blueprint $table) {
            $table->decimal('base_making_charges_amount', 12, 4)->default(0)->nullable();
            $table->decimal('making_charges_amount', 12, 4)->default(0)->nullable();

            $table->decimal('other_amount', 12, 4)->default(0)->nullable();
            $table->decimal('base_other_amount', 12, 4)->default(0)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('carts', function (Blueprint $table) {

        });
    }
};
