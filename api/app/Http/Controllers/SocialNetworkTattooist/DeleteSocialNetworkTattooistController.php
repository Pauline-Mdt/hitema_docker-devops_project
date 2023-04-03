<?php

namespace App\Http\Controllers\SocialNetworkTattooist;

use App\Http\Controllers\Controller;
use App\Models\SocialNetworkTattooist;
use Illuminate\Http\Request;

class DeleteSocialNetworkTattooistController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request, SocialNetworkTattooist $socialNetworkTattooist)
    {
        $socialNetworkTattooist->delete();
        $socialNetwork = $socialNetworkTattooist->socialNetwork;
        $tattooist = $socialNetworkTattooist->tattooist;
        return response()->json("Réseau social $socialNetwork->name du tatoueur $tattooist->name supprimé");
    }
}
