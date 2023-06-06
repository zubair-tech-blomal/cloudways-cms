<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Backend\Auth\LoginController;
use App\Http\Controllers\Backend\Auth\ResetPasswordController;
use App\Http\Controllers\Backend\Auth\ForgotPasswordController;
use App\Http\Controllers\Backend\DashboardsController;
use App\Http\Controllers\Backend\AdminsController;
use App\Http\Controllers\Backend\RolesController;
use App\Http\Controllers\Backend\FaqsController;
use App\Http\Controllers\Backend\ContactsController;
use App\Http\Controllers\Backend\CacheController;
use App\Http\Controllers\Backend\LanguagesController;
use App\Http\Controllers\Backend\SettingsController;

/*
|--------------------------------------------------------------------------
| Backend Routes
|--------------------------------------------------------------------------
|
| Admin Panel Route List
|
*/

Route::get('/', [DashboardsController::class, 'index'])->name('index');

// Login Routes
Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
Route::post('/login/submit', [LoginController::class, 'login'])->name('login.submit');
Route::post('/logout/submit', [LoginController::class, 'logout'])->name('logout');

// Reset Password Routes
Route::get('/password/reset', [ForgotPasswordController::class, 'showLinkRequestForm'])->name('password.request');
Route::post('/password/reset', [ResetPasswordController::class, 'reset'])->name('password.update');

/**
 * Admin Management Routes
 */
Route::group(['prefix' => ''], function () {
    Route::resource('admins', AdminsController::class);
    Route::get('admins/trashed/view', [AdminsController::class, 'trashed'])->name('admins.trashed');
    Route::get('profile/edit', [AdminsController::class, 'editProfile'])->name('admins.profile.edit');
    Route::put('profile/update', [AdminsController::class, 'updateProfile'])->name('admins.profile.update');
    Route::delete('admins/trashed/destroy/{id}', [AdminsController::class, 'destroyTrash'])->name('admins.trashed.destroy');
    Route::put('admins/trashed/revert/{id}', [AdminsController::class, 'revertFromTrash'])->name('admins.trashed.revert');
});

/**
 * Role & Permission Management Routes
 */
Route::group(['prefix' => ''], function () {
    Route::resource('roles', RolesController::class);
});

/**
 * Blog Management Routes
 */
Route::group(['prefix' => ''], function () {
    Route::resource('faqs', FaqsController::class);
    Route::get('faqs/trashed/view', [FaqsController::class, 'trashed'])->name('faqs.trashed');
    Route::delete('faqs/trashed/destroy/{id}', [FaqsController::class, 'destroyTrash'])->name('faqs.trashed.destroy');
    Route::put('faqs/trashed/revert/{id}', [FaqsController::class, 'revertFromTrash'])->name('faqs.trashed.revert');
});

/**
 * Contact Routes
 */
Route::group(['prefix' => ''], function () {
    Route::resource('contacts', ContactsController::class);
});

/**
 * Settings Management Routes
 */
Route::group(['prefix' => 'settings'], function () {
    Route::get('/', [SettingsController::class, 'index'])->name('settings.index');
    Route::put('/update', [SettingsController::class, 'update'])->name('settings.update');
    Route::resource('languages', LanguagesController::class);
});


Route::get('reset-cache', [CacheController::class, 'reset_cache']);
