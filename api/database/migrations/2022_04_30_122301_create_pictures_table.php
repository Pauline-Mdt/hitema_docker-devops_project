<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePicturesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pictures', function (Blueprint $table) {
            $table->smallIncrements('id');
            $table->unique(['tattooist_id','picture_id']);
            $table->unsignedSmallInteger('tattooist_id');
            $table->unsignedSmallInteger('picture_id');
            $table->string('name', 64)->unique();
            $table->boolean('is_main')->default(0);
            $table->boolean('is_visible')->default(1);
            $table->timestamps();

            $table->foreign('tattooist_id')->references('id')->on('tattooists');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('pictures', function (Blueprint $table) {
            $table->dropForeign(['tattooist_id']);
        });
        Schema::dropIfExists('pictures');
    }
}
