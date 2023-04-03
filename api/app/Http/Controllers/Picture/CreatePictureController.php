<?php

namespace App\Http\Controllers\Picture;

use App\Http\Controllers\Controller;
use App\Http\Requests\PictureDataRequest;
use App\Models\Picture;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CreatePictureController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(PictureDataRequest $request)
    {
        $picture = new Picture();

        foreach ($request->safe()->except('picture') as $key => $value) {
            $picture[$key] = $value;
        }

        $picture['picture_id'] = Picture::query()->where('tattooist_id', $picture->tattooist->id)->count() + 1;
        $picture['name'] = $request->file('picture')->hashName();
        Storage::putFile('public/pictures', $request->file('picture'));

        $picture->save();

        return response()->json($picture, 201);
    }
}
