<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BusinessController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\AuthController;

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
/*
Route::get('/', function () {
    return view('welcome');
});
*/

//Route::get('/', [BusinessController::class, 'index'])->name('index');
//Route::get('/', [LoginController::class, 'getLogin'])->name('adminLogin');
//Route::get('/admin', [LoginController::class, 'getLogin'])->name('adminLogin');

/* admin dashboard */

Route::group(['prefix' => 'admin', 'namespace' => 'Admin'], function () {

  Route::get('/login', [LoginController::class, 'getLogin'])->name('adminLogin');
  Route::post('/login', [LoginController::class, 'postLogin'])->name('adminLoginPost');
  Route::get('/dashboard', [AdminController::class, 'getDashboard'])->name('adminDashboard');
  Route::get('/users/all', [AdminController::class, 'getUsers'])->name('getUsers');
  Route::get('/users/tutor', [AdminController::class, 'getTutor'])->name('getTutor');
  Route::get('/users/student', [AdminController::class, 'getStudent'])->name('getStudent');
  Route::get('/users/parent', [AdminController::class, 'getParent'])->name('getParent');

  Route::get('/block-users/all', [AdminController::class, 'getBlockUsers'])->name('getBlockUsers');
  Route::get('/block-users/tutor', [AdminController::class, 'getBlockTutor'])->name('getBlockTutor');
  Route::get('/block-users/student', [AdminController::class, 'getBlockStudent'])->name('getBlockStudent');
  Route::get('/block-users/parent', [AdminController::class, 'getBlockParent'])->name('getBlockParent');
  Route::post('/delete-user', [AdminController::class, 'deleteUser'])->name('delete.user');
  Route::get('/users/info/{id}/{type}', [AdminController::class, 'userInfo'])->name('userInfo');
  Route::get('/users/block/{id}/{type}', [AdminController::class, 'blockUser'])->name('blockUser');
  Route::get('/users/unblock/{id}/{type}', [AdminController::class, 'unblockUser'])->name('unblockUser');

  Route::get('/users/detail/{id}', [AdminController::class, 'profile'])->name('profile');

  Route::get('/courses', [AdminController::class, 'getCourse'])->name('viewCourse');
  Route::get('/courses/add', [AdminController::class, 'addCourse'])->name('addCourse');
  Route::get('/edit-course/{id}', [AdminController::class, 'editCourse'])->name('edit.course');
  Route::get('/course-info/{id}', [AdminController::class, 'courseInfo'])->name('info.course');
  Route::post('/save-course', [AdminController::class, 'saveCourse'])->name('save.course');
  Route::post('/update-course/{id}', [AdminController::class, 'updateCourse'])->name('update.course');
  Route::post('/delete-course', [AdminController::class, 'deleteCourse'])->name('delete.course');

  Route::get('/quiz/add', [AdminController::class, 'addQuestion'])->name('addQuestion');
  Route::get('/quiz', [AdminController::class, 'viewQuestion'])->name('question');
  Route::get('/quiz/edit/{id}', [AdminController::class, 'editQuestion'])->name('edit.question');
  Route::post('/save-quiz', [AdminController::class, 'saveQuestion'])->name('save.question');
  Route::put('/quiz/{id}', [AdminController::class, 'updateQuestion'])->name('update.question');
  Route::post('/delete-quiz', [AdminController::class, 'deleteQuestion'])->name('delete.question');

  Route::get('/events/add', [AdminController::class, 'addEvent'])->name('addEvent');
  Route::get('/events', [AdminController::class, 'viewEvent'])->name('viewEvent');
  Route::get('/event/edit/{id}', [AdminController::class, 'editEvent'])->name('editEvent');
  Route::post('/save-events', [AdminController::class, 'saveEvent'])->name('save.events');
  Route::post('/delete-events', [AdminController::class, 'deleteEvent'])->name('delete.event');
  Route::put('/update-events/{id}', [AdminController::class, 'updateEvent'])->name('update.events');
  Route::get('/contacts', [AdminController::class, 'viewContact'])->name('viewContact');
  Route::get('/user-banners', [AdminController::class, 'banner'])->name('banner');
});

// reset password
Route::get('/user/reset-password', [AuthController::class, 'successPasswordReset'])->name('update.reseted.successfully');
Route::get('/user/reset-password/{resetToken}', [AuthController::class, 'resetPassword']);
Route::post('/user/reset-password/{resetToken}', [AuthController::class, 'updateNewPassword'])->name('update.reseted.password');
