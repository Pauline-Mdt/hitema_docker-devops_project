<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserDataRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class CreateUserController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(UserDataRequest $request)
    {
        $user = new User();

        foreach ($request->safe() as $key => $value) {
            ($key == 'password') ? $user[$key] = Hash::make($value) : $user[$key] = $value;
        }

        $user->save();

        return response()->json($user, 201);
    }
}
