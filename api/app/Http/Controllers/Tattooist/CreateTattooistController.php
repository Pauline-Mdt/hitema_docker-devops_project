<?php

namespace App\Http\Controllers\Tattooist;

use App\Http\Controllers\Controller;
use App\Http\Requests\TattooistDataRequest;
use App\Models\Tattooist;
use Illuminate\Http\Request;

class CreateTattooistController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(TattooistDataRequest $request)
    {
        $tattooist = new Tattooist();

        foreach ($request->safe() as $key => $value) {
            $tattooist[$key] = $value;
        }

        $tattooist->save();

        return response()->json($tattooist, 201);
    }
}
