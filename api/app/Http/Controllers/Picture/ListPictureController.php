<?php

namespace App\Http\Controllers\Picture;

use App\Http\Controllers\Controller;
use App\Models\Picture;
use Illuminate\Http\Request;

class ListPictureController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request)
    {
        $pictures = Picture::all();

        return response()->json($pictures);
    }
}
