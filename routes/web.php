<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('dashboard');
})->name('beranda');

Route::get('/login', function () {
    return view('login');
})->name('login');

Route::get('/dashboard', function () {
    return view('dashboard');
})->name('dashboard');

Route::get('/rekapitulasi-dana', function () {
    return view('rekapitulasi-dana');
})->name('rekapitulasi-dana');

Route::get('/manajemen-kampanye', function () {
    return view('manajemen-kampanye');
})->name('manajemen-kampanye');

Route::get('/donatur', function () {
    return view('donatur');
})->name('donatur');

Route::get('/kelola-akun-operator', function () {
    return view('kelola-akun-operator');
})->name('kelola-akun-operator');

Route::get('/operator/dashboard', function () {
    return view('operator.dashboard');
})->name('operator.dashboard');

Route::get('/buat-kampanye', function () {
    return view('buat-kampanye');
})->name('buat-kampanye');

Route::get('/operator/buat-kampanye', function () {
    return redirect()->route('buat-kampanye');
})->name('operator.buat-kampanye');

Route::get('/catatan-pengeluaran-donasi', function () {
    return view('catatan-pengeluaran-donasi');
})->name('catatan-pengeluaran-donasi');

Route::get('/operator/catatan-pengeluaran-donasi', function () {
    return redirect()->route('catatan-pengeluaran-donasi');
})->name('operator.catatan-pengeluaran-donasi');

Route::get('/operator/rekapitulasi-dana', function () {
    return redirect()->route('rekapitulasi-dana');
})->name('operator.rekapitulasi-dana');


