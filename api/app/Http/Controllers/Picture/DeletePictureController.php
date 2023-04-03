<?php

namespace App\Http\Controllers\Picture;

use App\Http\Controllers\Controller;
use App\Models\Picture;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class DeletePictureController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request, Picture $picture)
    {
//        Storage::delete('public/pictures/DRBoYa0uGGVGBohRRQP8OYVdGWmkbtdotf8VED3r.png');
        Storage::delete('public/pictures/'.$picture->name);

        $picture->delete();

        $tattooistPictures = Picture::query()->where('tattooist_id', $picture->tattooist->id)
            ->where('picture_id', '>', $picture->picture_id)
            ->get();
        foreach ($tattooistPictures as $tattooistPicture) {
            $tattooistPicture->picture_id -= 1;
            $tattooistPicture->save();
        }

        $tattooist = $picture->tattooist;
        return response()->json("Photo $picture->picture_id du tatoueur $tattooist->name supprimé");
    }
}
