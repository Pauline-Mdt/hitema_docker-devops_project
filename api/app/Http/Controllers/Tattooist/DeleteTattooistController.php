<?php

namespace App\Http\Controllers\Tattooist;

use App\Http\Controllers\Controller;
use App\Models\Tattooist;
use Illuminate\Http\Request;

class DeleteTattooistController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request, Tattooist $tattooist)
    {
        $tattooist->delete();

        return response()->json([
            'message' => "Tatoueur $tattooist->name supprimé"
        ]);
    }
}
