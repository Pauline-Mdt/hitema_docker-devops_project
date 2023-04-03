<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class TattooistWorkplaceFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'workplace_id' => $this->faker->numberBetween(1, 5),
            'tattooist_id' => $this->faker->randomDigitNotNull(),
            'start_date' => $this->faker->dateTime(),
            'end_date' => $this->faker->dateTime(),
        ];
    }
}
