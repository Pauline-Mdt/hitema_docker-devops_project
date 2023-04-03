<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\PersonalAccessToken;

class CheckTokenAuthController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request)
    {
        $requestToken = $request->bearerToken();

        if (!$requestToken) {
            $exist = false;
        } else {
            $registerToken = PersonalAccessToken::findToken($requestToken);

            if (!$registerToken) {
                $exist = false;
            } else {
                $exist = true;
            }
        }

        return response()->json([
            'message' => $exist,
        ]);
    }
}
