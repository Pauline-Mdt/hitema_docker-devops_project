<?php

namespace App\Http\Controllers\SocialNetworkTattooist;

use App\Http\Controllers\Controller;
use App\Http\Requests\SocialNetworkTattooistDataRequest;
use App\Models\SocialNetworkTattooist;
use Illuminate\Http\Request;

class UpdateSocialNetworkTattooistController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(SocialNetworkTattooistDataRequest $request, SocialNetworkTattooist $socialNetworkTattooist)
    {
        foreach ($request->safe() as $key => $value) {
            $socialNetworkTattooist[$key] = $value;
        }

        $socialNetworkTattooist->save();

        return response($socialNetworkTattooist);
    }
}
