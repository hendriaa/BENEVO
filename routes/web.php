
<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application.
|
*/

// Halaman utama
Route::get('/', function () {
    return view('dashboard');
})->name('beranda');

// Login
Route::get('/login', function () {
    return view('login');
})->name('login');

// Dashboard
Route::get('/dashboard', function () {
    return view('dashboard');
})->name('dashboard');

// Rekapitulasi Dana
Route::get('/rekapitulasi-dana', function () {
    return view('rekapitulasi-dana');
})->name('rekapitulasi-dana');

// Manajemen Kampanye
Route::get('/manajemen-kampanye', function () {
    return view('manajemen-kampanye');
})->name('manajemen-kampanye');

// Donatur
Route::get('/donatur', function () {
    return view('donatur');
})->name('donatur');

// Kelola Akun Operator
Route::get('/kelola-akun-operator', function () {
    return view('kelola-akun-operator');
})->name('kelola-akun-operator');

// Pengajuan Kampanye (dari main)
Route::get('/pengajuan-kampanye', function () {
    return view('pengajuan-kampanye');
})->name('pengajuan-kampanye');

Route::get('/detail-pengajuan-kampanye', function () {
    return view('detail-pengajuan-kampanye');
})->name('detail-pengajuan-kampanye');

// Operator Dashboard (dari operator)
Route::get('/operator/dashboard', function () {
    return view('operator.dashboard');
})->name('operator.dashboard');

// Buat Kampanye
Route::get('/buat-kampanye', function () {
    return view('buat-kampanye');
})->name('buat-kampanye');

Route::get('/operator/buat-kampanye', function () {
    return redirect()->route('buat-kampanye');
})->name('operator.buat-kampanye');

// Catatan Pengeluaran Donasi
Route::get('/catatan-pengeluaran-donasi', function () {
    return view('catatan-pengeluaran-donasi');
})->name('catatan-pengeluaran-donasi');

Route::get('/operator/catatan-pengeluaran-donasi', function () {
    return redirect()->route('catatan-pengeluaran-donasi');
})->name('operator.catatan-pengeluaran-donasi');

// Operator Rekapitulasi Dana
Route::get('/operator/rekapitulasi-dana', function () {
    return redirect()->route('rekapitulasi-dana');
})->name('operator.rekapitulasi-dana');
