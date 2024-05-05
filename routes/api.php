<?php
use App\Http\Controllers\CustomProductSizeController;
use App\Http\Controllers\LiveDemoAppointmentController;

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
// Route::group(['middleware' => ['auth:sanctum', 'sanctum.customer']], function () {

// });
Route::get('v1/live-demo/appointments', [LiveDemoAppointmentController::class, 'getAll']);
Route::get('v1/live-demo/appointments/{liveDemoAppointment}', [LiveDemoAppointmentController::class, 'getOne']);
Route::post('v1/live-demo/appointments-store', [LiveDemoAppointmentController::class, 'schedule']);
Route::post('v1/custom-product-sizes', [CustomProductSizeController::class, 'store']);
