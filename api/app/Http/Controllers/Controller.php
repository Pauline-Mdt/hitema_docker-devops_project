<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function home() {
        return response()->json([
            'message' => 'Successful connection.'
        ]);
    }

    public function routeError() {
        return response()->json([
            'message' => 'No route matches the incoming request.'
        ], 404);
    }
}
