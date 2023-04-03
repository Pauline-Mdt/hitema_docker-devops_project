<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class TattooistFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'is_resident' => $this->faker->boolean(),
            'is_active' => '1',
            'name' => $this->faker->unique()->name(),
            'email' => $this->faker->unique()->safeEmail(),
            'description' => $this->faker->optional()->realText(),
        ];
    }
}
