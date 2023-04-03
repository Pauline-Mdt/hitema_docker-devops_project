<?php

namespace App\Http\Controllers\Document;

use App\Http\Controllers\Controller;
use App\Models\Document;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class DeleteDocumentController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request, Document $document)
    {
//        Storage::delete('documents/kSbeJRw8Dy47UDbg0gXUowz2Fuo6u2Srcof07j4D.pdf');
        Storage::delete('documents/'.$document->name);

        $document->delete();

        return response()->json("Document $document->title supprimé");
    }
}
