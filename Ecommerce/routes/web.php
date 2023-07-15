<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\AdminController;

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




route::get('/', [HomeController::class, 'index']);

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified'
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});

route::get('/redirect', [HomeController::class, 'redirect'])->middleware('auth', 'verified');
route::get('/view_category', [AdminController::class, 'view_category']);
route::post('/add_category', [AdminController::class, 'add_category']);
route::get('/delete_category/{id}', [AdminController::class, 'delete_category']);
route::get('/show_product', [AdminController::class, 'show_product']);
route::post('/add_product', [AdminController::class, 'add_product']);
route::get('/view_product', [AdminController::class, 'view_product']);
route::get('/delete_product/{id}', [AdminController::class, 'delete_product']);
route::get('/edit_product/{id}', [AdminController::class, 'edit_product']);
route::post('/update_product/{id}', [AdminController::class, 'update_product']);
route::get('/product_details/{id}', [HomeController::class, 'product_details']);
route::post('/add_cart/{id}', [HomeController::class, 'add_cart']);
route::get('/show_cart', [HomeController::class, 'show_cart']);
route::get('/remove_cart/{id}', [HomeController::class, 'remove_cart']);
route::get('/cash_order', [HomeController::class, 'cash_order']);
route::get('/stripe/{totalprice}', [HomeController::class, 'stripe']);
Route::post('stripe/{totalprice}', [HomeController::class, 'stripePost'])->name('stripe.post');
route::get('/view_order', [AdminController::class, 'view_order']);
route::get('/delivered/{id}', [AdminController::class, 'delivered']);
route::get('/pdf/{id}', [AdminController::class, 'pdf']);
route::get('/Send_email/{id}', [AdminController::class, 'Send_email']);
route::post('/send_emails/{id}', [AdminController::class, 'send_emails']);
route::get('/search', [AdminController::class, 'search_order']);
route::get('/show_order', [HomeController::class, 'show_order']);
route::get('/cancel_order/{id}', [HomeController::class, 'cancel_order']);

route::post('/add_comment', [HomeController::class, 'add_comment']);
route::post('/add_reply', [HomeController::class, 'add_reply']);
route::get('/product_search', [HomeController::class, 'product_search']);
route::get('/Products', [HomeController::class, 'Products']);
route::get('/search_product', [HomeController::class, 'search_product']);