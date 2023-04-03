<?php

namespace App\Http\Controllers\Tattooist;

use App\Http\Controllers\Controller;
use App\Http\Requests\TattooistDataRequest;
use App\Models\Tattooist;
use Illuminate\Http\Request;

class UpdateTattooistController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(TattooistDataRequest $request, Tattooist $tattooist)
    {
        foreach ($request->safe() as $key => $value) {
            $tattooist[$key] = $value;
        }

        $tattooist->save();

        return response()->json($tattooist);
    }
}
