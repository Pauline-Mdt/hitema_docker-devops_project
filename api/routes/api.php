<?php

use App\Http\Controllers\Auth;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Document;
use App\Http\Controllers\DocumentCategory;
use App\Http\Controllers\Picture;
use App\Http\Controllers\SocialNetwork;
use App\Http\Controllers\SocialNetworkTattooist;
use App\Http\Controllers\Subscriber;
use App\Http\Controllers\Tattooist;
use App\Http\Controllers\TattooistWorkplace;
use App\Http\Controllers\User;
use App\Http\Controllers\Workplace;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});

Route::group([
    'middleware' => 'sanitize'
], function () {
    //Public routes
    Route::get('/', [Controller::class, 'home']);

    Route::group([
        'prefix' => 'auth'
    ], function () {
        Route::post('/login', Auth\LoginAuthController::class);
        Route::get('/token', Auth\CheckTokenAuthController::class);
    });

    Route::group([
        'prefix' => 'subscribers'
    ], function () {
        Route::get('', Subscriber\ListSubscriberController::class);
        Route::get('/{subscriber}', Subscriber\ShowSubscriberController::class);
        Route::post('', Subscriber\CreateSubscriberController::class);
        Route::put('/{subscriber}', Subscriber\UpdateSubscriberController::class);
        Route::delete('/{subscriber}', Subscriber\DeleteSubscriberController::class);
    });

    Route::group([
        'prefix' => 'tattooists'
    ], function () {
        Route::get('', Tattooist\ListTattooistController::class);
        Route::get('/{tattooist}', Tattooist\ShowTattooistController::class);
        Route::get('/{tattooist}/pictures/{isMain?}', Tattooist\Picture\ListTattooistPictureController::class);
        Route::get('/{tattooist}/social-networks', Tattooist\SocialNetwork\ListTattooistSocialNetworkController::class);
        Route::get('/{tattooist}/workplaces', Tattooist\Workplace\ListTattooistWorkplaceController::class);
    });

    //Logged-in users - with "auth" middleware
    Route::group([
        'middleware' => 'auth:sanctum',
    ], function () {
        Route::group([
            'prefix' => 'auth'
        ], function () {
            Route::get('/logout', Auth\LogoutAuthController::class);
            Route::get('/profile', Auth\ShowProfileAuthController::class);
            Route::get('/documents', Auth\ListDocumentAuthController::class);
            Route::get('/tattooist', Auth\ShowTattooistAuthController::class);
        });

        Route::group([
            'prefix' => 'pictures'
        ], function () {
            Route::get('', Picture\ListPictureController::class);
            Route::get('/{picture}', Picture\ShowPictureController::class);
            Route::post('', Picture\CreatePictureController::class);
            Route::post('/{picture}', Picture\UpdatePictureController::class); //To update picture with file
            Route::put('/{picture}', Picture\UpdatePictureController::class); //To update picture without file
            Route::delete('/{picture}', Picture\DeletePictureController::class);
        });

        Route::group([
            'prefix' => 'social-networks-tattooists'
        ], function () {
            Route::get('', SocialNetworkTattooist\ListSocialNetworkTattooistController::class);
            Route::get('/{socialNetworkTattooist}', SocialNetworkTattooist\ShowSocialNetworkTattooistController::class);
            Route::post('', SocialNetworkTattooist\CreateSocialNetworkTattooistController::class);
            Route::put('/{socialNetworkTattooist}', SocialNetworkTattooist\UpdateSocialNetworkTattooistController::class);
            Route::delete('/{socialNetworkTattooist}', SocialNetworkTattooist\DeleteSocialNetworkTattooistController::class);
        });

        Route::group([
            'prefix' => 'social-networks'
        ], function () {
            Route::get('', SocialNetwork\ListSocialNetworkController::class);
            Route::get('/{socialNetwork}', SocialNetwork\ShowSocialNetworkController::class);
        });

        Route::group([
            'prefix' => 'tattooists'
        ], function () {
            Route::put('/{tattooist}', Tattooist\UpdateTattooistController::class);
        });

        Route::group([
            'prefix' => 'users'
        ], function () {
            Route::put('/{user}', User\UpdateUserController::class);
        });

        //Admin users - with "auth" and "admin" middleware - path /admin/xxx
        Route::group([
            'middleware' => 'admin',
        ], function () {
            Route::group([
                'prefix' => 'documents'
            ], function () {
                Route::get('', Document\ListDocumentController::class);
                Route::get('/{document}', Document\ShowDocumentController::class);
                Route::post('', Document\CreateDocumentController::class);
                Route::post('/{document}', Document\UpdateDocumentController::class); //To update document with file
                Route::put('/{document}', Document\UpdateDocumentController::class); //To update document without file
                Route::delete('/{document}', Document\DeleteDocumentController::class);
            });

            Route::group([
                'prefix' => 'document-categories'
            ], function () {
                Route::get('', DocumentCategory\ListDocumentCategoryController::class);
                Route::get('/{documentCategory}', DocumentCategory\ShowDocumentCategoryController::class);
                Route::post('', DocumentCategory\CreateDocumentCategoryController::class);
                Route::put('/{documentCategory}', DocumentCategory\UpdateDocumentCategoryController::class);
                Route::delete('/{documentCategory}', DocumentCategory\DeleteDocumentCategoryController::class);
            });

            Route::group([
                'prefix' => 'social-networks'
            ], function () {
                Route::post('', SocialNetwork\CreateSocialNetworkController::class);
                Route::put('/{socialNetwork}', SocialNetwork\UpdateSocialNetworkController::class);
                Route::delete('/{socialNetwork}', SocialNetwork\DeleteSocialNetworkController::class);
            });

            Route::group([
                'prefix' => 'tattooists'
            ], function () {
                Route::post('', Tattooist\CreateTattooistController::class);
                Route::delete('/{tattooist}', Tattooist\DeleteTattooistController::class);
            });

            Route::group([
                'prefix' => 'tattooists-workplaces'
            ], function () {
                Route::get('', TattooistWorkplace\ListTattooistWorkplaceController::class);
                Route::get('/{tattooistWorkplace}', TattooistWorkplace\ShowTattooistWorkplaceController::class);
                Route::post('', TattooistWorkplace\CreateTattooistWorkplaceController::class);
                Route::put('/{tattooistWorkplace}', TattooistWorkplace\UpdateTattooistWorkplaceController::class);
                Route::delete('/{tattooistWorkplace}', TattooistWorkplace\DeleteTattooistWorkplaceController::class);
            });

            Route::group([
                'prefix' => 'users'
            ], function () {
                Route::get('', User\ListUserController::class);
                Route::get('/{user}', User\ShowUserController::class);
                Route::get('/{user}/documents', User\Document\ListUserDocumentController::class);
                Route::get('/{user}/tattooist', User\Tattooist\ShowUserTattooistController::class);
                Route::post('', User\CreateUserController::class);
                Route::delete('/{user}', User\DeleteUserController::class);
            });

            Route::group([
                'prefix' => 'workplaces'
            ], function () {
                Route::get('', Workplace\ListWorkplaceController::class);
                Route::get('/{workplace}', Workplace\ShowWorkplaceController::class);
                Route::post('', Workplace\CreateWorkplaceController::class);
                Route::put('/{workplace}', Workplace\UpdateWorkplaceController::class);
                Route::delete('/{workplace}', Workplace\DeleteWorkplaceController::class);
            });
        });
    });

    //Fallback route when no other matches
    Route::fallback([Controller::class, 'routeError']);
});
