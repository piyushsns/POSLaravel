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
        Schema::dropIfExists('live_demo_appointments');

        Schema::create('live_demo_appointments', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('customer_id')->nullable();
            $table->unsignedBigInteger('product_id')->nullable();
            $table->date('appointment_date')->nullable();
            $table->time('appointment_time')->nullable();
            $table->string('miro_room_id')->nullable();
            $table->string('contact_info')->nullable();
            $table->string('first_name')->nullable();
            $table->string('last_name')->nullable();
            $table->string('phone')->nullable();
            $table->string('email')->nullable();
            $table->enum('event_type', ['I am a Groom', 'I am a Bride', 'Attending an Event', 'Other'])->nullable();
            $table->string('event_type_text')->nullable();
            $table->string('what_are_you_looking_for')->nullable();
            $table->string('status')->nullable()->default('scheduled');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('live_demo_appointments');
    }
};
