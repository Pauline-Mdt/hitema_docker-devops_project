<?php

namespace App\Http\Controllers\TattooistWorkplace;

use App\Http\Controllers\Controller;
use App\Models\TattooistWorkplace;
use Illuminate\Http\Request;

class ListTattooistWorkplaceController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request)
    {
        $tattooistsWorkplaces = TattooistWorkplace::all();

        return response()->json($tattooistsWorkplaces);
    }
}
