<?php

namespace App\Http\Controllers\Workplace;

use App\Http\Controllers\Controller;
use App\Models\Workplace;
use Illuminate\Http\Request;

class ListWorkplaceController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request)
    {
        $workplaces = Workplace::all();

        return response()->json($workplaces);
    }
}
