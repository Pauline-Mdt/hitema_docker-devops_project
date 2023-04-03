<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class ListUserController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request)
    {
        $users = User::all();

        foreach ($users as $user) {
            $user['tattooist'] = $user->tattooist;
            $user['documents'] = $user->documents;
        }

        return response()->json($users);
    }
}
