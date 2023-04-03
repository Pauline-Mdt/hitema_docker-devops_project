<?php

namespace App\Http\Controllers\TattooistWorkplace;

use App\Http\Controllers\Controller;
use App\Http\Requests\TattooistWorkplaceDataRequest;
use App\Models\TattooistWorkplace;
use Illuminate\Http\Request;

class CreateTattooistWorkplaceController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(TattooistWorkplaceDataRequest $request)
    {
        $tattooistWorkplace = new TattooistWorkplace();

        foreach ($request->safe() as $key => $value) {
            $tattooistWorkplace[$key] = $value;
        }

        $tattooistWorkplace->save();

        return response()->json($tattooistWorkplace, 201);
    }
}
