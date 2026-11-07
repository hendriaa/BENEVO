<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    // Tampilkan halaman login
    public function showLogin()
    {
        return view('login');
    }

    // Proses login
    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email'    => ['required', 'email'],
            'password' => ['required'],
            'role'     => ['required', 'in:admin,operator'],
        ]);

        $user = \App\Models\User::where('email', $credentials['email'])->first();

        if (
            !$user ||
            !\Illuminate\Support\Facades\Hash::check($credentials['password'], $user->password_hash) ||
            $user->role !== $credentials['role'] ||
            !$user->is_active
        ) {
            return back()
                ->withErrors(['email' => 'Email, kata sandi, atau jenis akses salah.'])
                ->onlyInput('email');
        }

        Auth::login($user);
        $request->session()->regenerate();

        return $user->role === 'admin'
            ? redirect()->route('dashboard')
            : redirect()->route('operator.dashboard');
    }

    // Logout
    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('login');
    }
}
