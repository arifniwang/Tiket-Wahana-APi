<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddImageWahana extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('wahana', function (Blueprint $table) {
            $table->string('image')->after('qrcode');
            $table->string('status')->default('Tutup');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('wahana', function (Blueprint $table) {
            $table->dropColumn('image');
            $table->dropColumn('status');
        });
    }
}
