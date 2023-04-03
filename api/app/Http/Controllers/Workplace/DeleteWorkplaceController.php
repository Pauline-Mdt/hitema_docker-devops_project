<?php

namespace App\Http\Controllers\Workplace;

use App\Http\Controllers\Controller;
use App\Models\Workplace;
use Illuminate\Http\Request;

class DeleteWorkplaceController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request, Workplace $workplace)
    {
        $workplace->delete();

        return response()->json("Poste de travail $workplace->number supprimé");
    }
}
