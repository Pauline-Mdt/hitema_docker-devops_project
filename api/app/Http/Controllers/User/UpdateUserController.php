<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserDataRequest;
use App\Models\User;
use Illuminate\Http\Request;

class UpdateUserController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(UserDataRequest $request, User $user)
    {
        foreach ($request->safe() as $key => $value) {
            $user[$key] = $value;
        }

        $user->save();

        return response()->json($user);
    }
}
