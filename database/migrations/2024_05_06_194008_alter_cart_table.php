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
            $table->decimal('cgst_percent', 12, 4)->default(0)->nullable();
            $table->decimal('sgst_percent', 12, 4)->default(0)->nullable();
        });
        // Schema::table('cart', function (Blueprint $table) {

        //     $table->decimal('cgst_total', 12, 4)->default(0)->nullable();
        //     $table->decimal('base_cgst_total', 12, 4)->default(0)->nullable();

        //     $table->decimal('sgst_total', 12, 4)->default(0)->nullable();
        //     $table->decimal('base_sgst_total', 12, 4)->default(0)->nullable();
        // });

        // Schema::table('cart_items', function (Blueprint $table) {

        //     $table->decimal('sgst_amount', 12, 4)->default(0)->nullable();
        //     $table->decimal('base_sgst_amount', 12, 4)->default(0)->nullable();

        //     $table->decimal('cgst_amount', 12, 4)->default(0)->nullable();
        //     $table->decimal('base_cgst_amount', 12, 4)->default(0)->nullable();
        // });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('cart', function (Blueprint $table) {

        });
    }
};
