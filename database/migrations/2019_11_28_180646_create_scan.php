<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateScan extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('scan', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            $table->string('scan_code');
            $table->integer('customers_id');
            $table->integer('activity_id');
            $table->integer('wahana_id');
            $table->integer('nominal')->nullable()->default('0');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('scan');
    }
}
