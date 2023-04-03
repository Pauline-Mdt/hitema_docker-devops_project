<?php

namespace App\Http\Controllers\User\Document;

use App\Http\Controllers\Controller;
use App\Models\Document;
use App\Models\User;
use Illuminate\Http\Request;

class ListUserDocumentController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request, User $user)
    {
        $userDocuments = $user->documents;

        return response()->json($userDocuments);
    }
}
