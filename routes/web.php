<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

// Login & logout
Route::get('/login', [AuthController::class, 'showLogin'])->name('login');
Route::post('/login', [AuthController::class, 'login'])->name('login.process');
Route::match(['get', 'post'], '/logout', [AuthController::class, 'logout'])->name('logout');

// Harus login (admin ATAU operator)
Route::middleware('auth')->group(function () {

    Route::get('/', function () {
        return auth()->user()->role === 'operator'
            ? redirect()->route('operator.dashboard')
            : redirect()->route('dashboard');
    })->name('beranda');

    // ===== Halaman khusus ADMIN =====
    Route::middleware('role:admin')->group(function () {
        Route::get('/dashboard', fn () => view('dashboard'))->name('dashboard');
        Route::get('/rekapitulasi-dana', fn () => view('rekapitulasi-dana'))->name('rekapitulasi-dana');
        Route::get('/manajemen-kampanye', fn () => view('manajemen-kampanye'))->name('manajemen-kampanye');
        Route::get('/donatur', fn () => view('donatur'))->name('donatur');
        Route::get('/kelola-akun-operator', fn () => view('kelola-akun-operator'))->name('kelola-akun-operator');
        Route::get('/pengajuan-kampanye', fn () => view('pengajuan-kampanye'))->name('pengajuan-kampanye');
        Route::get('/detail-pengajuan-kampanye', fn () => view('detail-pengajuan-kampanye'))->name('detail-pengajuan-kampanye');
        Route::get('/tangguhkan-operator', fn () => view('tangguhkan-operator'))->name('tangguhkan-operator');
        Route::get('/operator-refund', fn () => view('operator-refund'))->name('operator-refund');
        Route::get('/kampanye-ditinjau', fn () => view('kampanye-ditinjau'))->name('kampanye-ditinjau');
        Route::get('/detail-peninjauan-kampanye', fn () => view('detail-peninjauan-kampanye'))->name('detail-peninjauan-kampanye');
    });

    // ===== Halaman khusus OPERATOR =====
    Route::middleware('role:operator')->group(function () {
        Route::get('/operator/dashboard', fn () => view('operator.dashboard'))->name('operator.dashboard');
        Route::get('/buat-kampanye', fn () => view('buat-kampanye'))->name('buat-kampanye');
        Route::get('/catatan-pengeluaran-donasi', fn () => view('catatan-pengeluaran-donasi'))->name('catatan-pengeluaran-donasi');

        Route::get('/operator/buat-kampanye', fn () => redirect()->route('buat-kampanye'))->name('operator.buat-kampanye');
        Route::get('/operator/catatan-pengeluaran-donasi', fn () => redirect()->route('catatan-pengeluaran-donasi'))->name('operator.catatan-pengeluaran-donasi');
        Route::get('/operator/rekapitulasi-dana', fn () => view('operator.rekapitulasi-dana'))->name('operator.rekapitulasi-dana');
    });
});
