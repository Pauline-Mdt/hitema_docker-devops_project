<?php

namespace App\Http\Controllers\User\Tattooist;

use App\Http\Controllers\Controller;
use App\Models\Tattooist;
use App\Models\User;
use Illuminate\Http\Request;

class ShowUserTattooistController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request, User $user)
    {
        $userTattooist = $user->tattooist;

        return response()->json($userTattooist);
    }
}
