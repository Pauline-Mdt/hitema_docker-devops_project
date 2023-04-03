<?php

namespace App\Http\Controllers\Tattooist\Workplace;

use App\Http\Controllers\Controller;
use App\Models\Tattooist;
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
    public function __invoke(Request $request, Tattooist $tattooist)
    {
        $tattooistWorkplaces = $tattooist->tattooistWorkplaces;

        return response()->json($tattooistWorkplaces);
    }
}
