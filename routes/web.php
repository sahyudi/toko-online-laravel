<?php

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

// use Illuminate\Routing\Route;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('auth.login');
    // return view('welcome');
});

Auth::routes();

Route::match(['GET', 'POST'], '/register', function () {
    return redirect('/login');
})->name('register');

Route::get('/home', 'HomeController@index')->name('home');

// controller user
Route::resource("users", "UserController");

// controller categrories
Route::get("/categories/trash", "CategoryController@trash")->name('categories.trash');
Route::get("/categories/{id}/restore", "CategoryController@restore")->name('categories.restore');
Route::delete('/categories/{category}/delete-permanent', 'CategoryController@deletePermanent')->name('categories.delete-permanent');

Route::resource("categories", "CategoryController");


Route::get('/ajax/categories/search', 'CategoryController@ajaxSearch');

// controller Book
Route::get('/books/trash', 'BookController@trash')->name('books.trash');
Route::post('/books/{book}/restore', 'BookController@restore')->name('books.restore');
Route::delete('/books/{id}/delete-permanent', 'BookController@deletePermanent')->name('books.delete-permanent');
Route::resource('books', 'BookController');


Route::resource('orders', 'OrderController');
