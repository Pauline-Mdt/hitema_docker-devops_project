<?php

namespace App\Http\Controllers\Subscriber;

use App\Http\Controllers\Controller;
use App\Http\Requests\SubscriberDataRequest;
use App\Models\Subscriber;
use Illuminate\Http\Request;

class CreateSubscriberController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke(SubscriberDataRequest $request)
    {
        $subscriber = new Subscriber();

        foreach ($request->safe() as $key => $value) {
            $subscriber[$key] = $value;
        }

        $subscriber->save();

        return response()->json($subscriber, 201);
    }
}
