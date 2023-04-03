<?php

namespace App\Http\Controllers\Tattooist\Picture;

use App\Http\Controllers\Controller;
use App\Models\Picture;
use App\Models\Tattooist;
use Illuminate\Http\Request;

class ListTattooistPictureController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request, Tattooist $tattooist, $isMain = null)
    {
        isset($isMain)? $tattooistPictures = $tattooist->picturesByMain($isMain) : $tattooistPictures = $tattooist->pictures;

        return response()->json($tattooistPictures);
    }
}
