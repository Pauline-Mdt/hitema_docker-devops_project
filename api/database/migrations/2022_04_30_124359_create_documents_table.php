<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDocumentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('documents', function (Blueprint $table) {
            $table->smallIncrements('id');
            $table->unsignedTinyInteger('document_category_id');
            $table->unsignedSmallInteger('user_id')->nullable();
            $table->string('title', 64)->unique();
            $table->string('name', 64)->unique();
            $table->string('extension', 8);
            $table->timestamps();

            $table->foreign('document_category_id')->references('id')->on('document_categories');
            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('documents', function (Blueprint $table) {
            $table->dropForeign(['document_category_id']);
            $table->dropForeign(['user_id']);
        });
        Schema::dropIfExists('documents');
    }
}
