<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_example()
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }

    public function test_api_home_route()
    {
        $response = $this->get('/api');

        $response->assertStatus(200);
    }

    public function test_api_all_tattooists_route()
    {
        $response = $this->get('/api/tattooists');

        $response->assertStatus(200);
    }

    public function test_api_all_subscribers_route()
    {
        $response = $this->get('/api/subscribers');

        $response->assertStatus(200);
    }
}
