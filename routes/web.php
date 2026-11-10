<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

// Login & logout
Route::get('/login', [AuthController::class, 'showLogin'])->name('login');
Route::post('/login', [AuthController::class, 'login'])->name('login.process');
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

// Harus login (admin ATAU operator)
Route::middleware('auth')->group(function () {

    // ===== Halaman khusus ADMIN =====
    Route::middleware('role:admin')->group(function () {
        Route::get('/', fn () => view('dashboard'))->name('beranda');
        Route::get('/dashboard', fn () => view('dashboard'))->name('dashboard');
        Route::get('/rekapitulasi-dana', fn () => view('rekapitulasi-dana'))->name('rekapitulasi-dana');
        Route::get('/manajemen-kampanye', fn () => view('manajemen-kampanye'))->name('manajemen-kampanye');
        Route::get('/donatur', fn () => view('donatur'))->name('donatur');
        Route::get('/kelola-akun-operator', fn () => view('kelola-akun-operator'))->name('kelola-akun-operator');
        Route::get('/pengajuan-kampanye', fn () => view('pengajuan-kampanye'))->name('pengajuan-kampanye');
        Route::get('/detail-pengajuan-kampanye', fn () => view('detail-pengajuan-kampanye'))->name('detail-pengajuan-kampanye');
    });

    // ===== Halaman khusus OPERATOR =====
    Route::middleware('role:operator')->group(function () {
        Route::get('/operator/dashboard', fn () => view('operator.dashboard'))->name('operator.dashboard');
        Route::get('/operator/buat-kampanye', fn () => redirect()->route('buat-kampanye'))->name('operator.buat-kampanye');
        Route::get('/operator/catatan-pengeluaran-donasi', fn () => redirect()->route('catatan-pengeluaran-donasi'))->name('operator.catatan-pengeluaran-donasi');
        Route::get('/operator/rekapitulasi-dana', fn () => view('rekapitulasi-dana'))->name('operator.rekapitulasi-dana');
    });

    // ===== Halaman yang boleh dibuka admin DAN operator =====
    Route::middleware('role:admin,operator')->group(function () {
        Route::get('/buat-kampanye', fn () => view('buat-kampanye'))->name('buat-kampanye');
        Route::get('/catatan-pengeluaran-donasi', fn () => view('catatan-pengeluaran-donasi'))->name('catatan-pengeluaran-donasi');
    });
});
