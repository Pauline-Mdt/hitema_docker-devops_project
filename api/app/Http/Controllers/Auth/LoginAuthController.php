<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\AuthDataRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginAuthController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(AuthDataRequest $request)
    {
        if (!Auth::attempt($request->safe()->toArray())) {
            return response()->json([
                'message' => "Les informations d'identification fournies ne correspondent pas à nos enregistrements."
            ], 400);
        }

        $user = Auth::user();
        $token = $user->createToken('user_'.$user->id.'_token');

        return response()->json([
            'user' => $user,
            'token' => $token->plainTextToken
        ]);
    }
}
