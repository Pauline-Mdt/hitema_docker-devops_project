<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class DocumentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'document_category_id' => $this->faker->numberBetween(1, 5),
            'user_id' => $this->faker->randomDigitNotNull(),
            'title' => $this->faker->unique()->words(5, true),
            'name' => $this->faker->unique()->uuid(),
            'extension' => '.'.$this->faker->fileExtension(),
        ];
    }
}
