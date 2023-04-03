<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSocialNetworkTattooistTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('social_network_tattooist', function (Blueprint $table) {
            $table->smallIncrements('id');
            $table->unique(['tattooist_id','social_network_id']);
            $table->unsignedSmallInteger('tattooist_id');
            $table->unsignedTinyInteger('social_network_id');
            $table->string('url')->unique();
            $table->timestamps();

            $table->foreign('tattooist_id')->references('id')->on('tattooists');
            $table->foreign('social_network_id')->references('id')->on('social_networks');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('social_network_tattooist', function (Blueprint $table) {
            $table->dropForeign(['tattooist_id']);
            $table->dropForeign(['social_network_id']);
        });
        Schema::dropIfExists('social_network_tattooist');
    }
}
