<?php

namespace App\Http\Controllers\Workplace;

use App\Http\Controllers\Controller;
use App\Http\Requests\WorkplaceDataRequest;
use App\Models\Workplace;
use Illuminate\Http\Request;

class CreateWorkplaceController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(WorkplaceDataRequest $request)
    {
        $workplace = new Workplace();

        foreach ($request->safe() as $key => $value) {
            $workplace[$key] = $value;
        }

        $workplace->save();

        return response()->json($workplace, 201);
    }
}
