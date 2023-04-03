<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTattooistWorkplaceTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tattooist_workplace', function (Blueprint $table) {
            $table->smallIncrements('id');
            $table->unique(['tattooist_id','workplace_id','start_date']);
            $table->unsignedTinyInteger('workplace_id');
            $table->unsignedSmallInteger('tattooist_id');
            $table->date('start_date');
            $table->date('end_date');
            $table->timestamps();

            $table->foreign('tattooist_id')->references('id')->on('tattooists');
            $table->foreign('workplace_id')->references('id')->on('workplaces');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tattooist_workplace', function (Blueprint $table) {
            $table->dropForeign(['tattooist_id']);
            $table->dropForeign(['workplace_id']);
        });
        Schema::dropIfExists('tattooist_workplace');
    }
}
