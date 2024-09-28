<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\ChildController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\TeacherController;
use App\Http\Controllers\ParentController;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/user/login', [AuthController::class, 'signin']);
Route::get('/user/logout', [AuthController::class, 'logout']);
Route::get('/user/refresh-token/{id}', [AuthController::class, 'refreshToken']);

Route::post('/user/forgot-password', [AuthController::class, 'changePassword']);
Route::post('/student/register', [AuthController::class, 'studentSignup']);
Route::post('/teacher/register', [AuthController::class, 'teacherSignup']);
Route::post('/teacher/update', [TeacherController::class, 'updateTeacher']);
Route::post('/parent/register', [AuthController::class, 'parentSignup']);
Route::post('/parent/update', [ParentController::class, 'updateParent']);

Route::post('/parent/add-child', [ChildController::class, 'addChild']);
Route::post('/parent/update-child', [ChildController::class, 'updateChild']);
Route::get('/parent/get-child/{parent_id}', [ChildController::class, 'getChild']);
Route::delete('/parent/delete-child/{id}', [ChildController::class, 'deleteChild']);

Route::get('/courses', [CourseController::class, 'index']);

Route::get('/user/profile', [ProfileController::class, 'profile']);
Route::post('/user/change-password', [ProfileController::class, 'changePassword']);
Route::get('/user/delete-account', [ProfileController::class, 'deleteAccount']);

Route::post('/user/add-banner', [ProfileController::class, 'addBanner']);
Route::post('/user/support-help', [ProfileController::class, 'supportHelp']);

Route::get('/events', [ProfileController::class, 'events']);
Route::get('/banners', [ProfileController::class, 'banners']);


