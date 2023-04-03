<?php

namespace App\Http\Controllers\Tattooist\SocialNetwork;

use App\Http\Controllers\Controller;
use App\Models\SocialNetwork;
use App\Models\SocialNetworkTattooist;
use App\Models\Tattooist;
use Illuminate\Http\Request;

class ListTattooistSocialNetworkController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request, Tattooist $tattooist)
    {
        $socialNetworksTattooist = SocialNetworkTattooist::query()
            ->join('social_networks', 'social_network_tattooist.social_network_id', '=', 'social_networks.id')
            ->select('social_network_tattooist.*', 'social_networks.name as social_network_name')
            ->where('tattooist_id', $tattooist->id)
            ->get();

        return response()->json($socialNetworksTattooist);
    }
}
