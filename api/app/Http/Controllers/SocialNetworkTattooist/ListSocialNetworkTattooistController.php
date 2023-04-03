<?php

namespace App\Http\Controllers\SocialNetworkTattooist;

use App\Http\Controllers\Controller;
use App\Models\SocialNetworkTattooist;
use Illuminate\Http\Request;

class ListSocialNetworkTattooistController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request)
    {
        $socialNetworksTattooists = SocialNetworkTattooist::all();

        return response()->json($socialNetworksTattooists);
    }
}
