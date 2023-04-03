<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTattooistsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tattooists', function (Blueprint $table) {
            $table->smallIncrements('id');
            $table->boolean('is_resident')->default(0);
            $table->boolean('is_active')->default(0);
            $table->string('name', 64)->unique();
            $table->string('email', 128)->unique();
            $table->text('description')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tattooists');
    }
}
