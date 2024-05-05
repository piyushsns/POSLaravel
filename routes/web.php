<?php
use App\Http\Controllers\LiveDemoAppointmentController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/calendar-event/{appointment}', [LiveDemoAppointmentController::class,'downloadCalendarEvent'])->name('calendar-event');
