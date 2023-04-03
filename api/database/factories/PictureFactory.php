<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class PictureFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'picture_id' => $this->faker->unique()->randomNumber(2, false),
            'name' => $this->faker->unique()->uuid().'.'.$this->faker->fileExtension(),
            'is_main' => $this->faker->boolean(),
            'is_visible' => $this->faker->boolean(80),
        ];
    }
}
