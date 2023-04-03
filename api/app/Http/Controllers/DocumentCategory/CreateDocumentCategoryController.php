<?php

namespace App\Http\Controllers\DocumentCategory;

use App\Http\Controllers\Controller;
use App\Http\Requests\DocumentCategoryDataRequest;
use App\Models\DocumentCategory;
use Illuminate\Http\Request;

class CreateDocumentCategoryController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(DocumentCategoryDataRequest $request)
    {
        $documentCategory = new DocumentCategory();

        foreach ($request->safe() as $key => $value) {
            $documentCategory[$key] = $value;
        }

        $documentCategory->save();

        return response()->json($documentCategory, 201);
    }
}
