<?php

namespace Database\Seeders;

use App\Models\Document;
use App\Models\DocumentCategory;
use App\Models\Picture;
use App\Models\SocialNetwork;
use App\Models\SocialNetworkTattooist;
use App\Models\Subscriber;
use App\Models\Tattooist;
use App\Models\TattooistWorkplace;
use App\Models\User;
use App\Models\Workplace;
use Database\Factories\UserFactory;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        SocialNetwork::factory()
            ->count(10)
            ->create();
        Workplace::factory()
            ->count(5)
            ->create();
        Tattooist::factory()
            ->count(10)
            ->has(
                Picture::factory()
                    ->count(3)
            )
            ->create();
        SocialNetworkTattooist::factory()
            ->count(5)
            ->create();
        TattooistWorkplace::factory()
            ->count(5)
            ->create();

        DocumentCategory::factory()
            ->count(5)
            ->create();
        User::factory()
            ->count(10)
            ->create();
        Document::factory()
            ->count(5)
            ->create();

        Subscriber::factory()
            ->count(20)
            ->create();

//        User::factory(10)->create();
    }
}
