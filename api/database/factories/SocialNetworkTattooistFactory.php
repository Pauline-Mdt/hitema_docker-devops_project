<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class SocialNetworkTattooistFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'tattooist_id' => $this->faker->randomDigitNotNull(),
            'social_network_id' => $this->faker->randomDigitNotNull(),
            'url' => $this->faker->unique()->url(),
        ];
    }
}
