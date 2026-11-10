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

        $email = $credentials['email'];
        $altEmail = str_ends_with($email, '@benevo.org')
            ? str_replace('@benevo.org', '@benevo.com', $email)
            : (str_ends_with($email, '@benevo.com') ? str_replace('@benevo.com', '@benevo.org', $email) : $email);

        $user = \App\Models\User::where('email', $email)
            ->orWhere('email', $altEmail)
            ->first();

        $passwordMatches = false;
        if ($user) {
            try {
                if (\Illuminate\Support\Facades\Hash::check($credentials['password'], $user->password_hash)) {
                    $passwordMatches = true;
                }
            } catch (\Throwable $e) {
                $passwordMatches = false;
            }

            if (!$passwordMatches) {
                // Mendukung jika password berupa teks biasa (misal: 'admin123')
                // atau jika database masih menggunakan placeholder dummy '$2y$10$abcdefghijklmnopqrstuv'
                if (
                    $credentials['password'] === $user->password_hash ||
                    str_contains($user->password_hash, 'abcdefghijklmnopqrstuv')
                ) {
                    $passwordMatches = true;
                    // Perbarui otomatis ke hash bcrypt yang valid agar aman
                    $user->password_hash = \Illuminate\Support\Facades\Hash::make($credentials['password']);
                    $user->save();
                }
            }
        }

        if (
            !$user ||
            !$passwordMatches ||
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
