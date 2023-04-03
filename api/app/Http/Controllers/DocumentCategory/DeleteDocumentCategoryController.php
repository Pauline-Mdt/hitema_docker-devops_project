<?php

namespace App\Http\Controllers\DocumentCategory;

use App\Http\Controllers\Controller;
use App\Models\DocumentCategory;
use Illuminate\Http\Request;

class DeleteDocumentCategoryController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(Request $request, DocumentCategory $documentCategory)
    {
        $documentCategory->delete();

        return response()->json("Catégorie $documentCategory->name supprimée");
    }
}
