<?php

namespace App\Http\Controllers\SocialNetwork;

use App\Http\Controllers\Controller;
use App\Models\SocialNetwork;
use Illuminate\Http\Request;

class DeleteSocialNetworkController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request, SocialNetwork $socialNetwork)
    {
        $socialNetwork->delete();

        return response()->json("Réseau social $socialNetwork->name supprimé");
    }
}
