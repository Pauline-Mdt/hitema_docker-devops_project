<?php

namespace App\Http\Controllers\SocialNetwork;

use App\Http\Controllers\Controller;
use App\Http\Requests\SocialNetworkDataRequest;
use App\Models\SocialNetwork;
use Illuminate\Http\Request;

class CreateSocialNetworkController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(SocialNetworkDataRequest $request)
    {
        $socialNetwork = new SocialNetwork();

        foreach ($request->safe() as $key => $value) {
            $socialNetwork[$key] = $value;
        }

        $socialNetwork->save();

        return response()->json($socialNetwork, 201);
    }
}
