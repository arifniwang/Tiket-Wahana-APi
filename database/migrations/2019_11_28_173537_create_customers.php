<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCustomers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            $table->string('qrcode');
            $table->string('name');
            $table->string('image')->nullable();
            $table->string('phone');
            $table->string('email');
            $table->string('password')->nullable();
            $table->string('forgot_password')->nullable();
            $table->integer('pin');
            $table->integer('saldo')->nullable()->default(0);
            $table->string('facebook_id')->nullable();
            $table->string('google_id')->nullable();
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customer');
    }
}
