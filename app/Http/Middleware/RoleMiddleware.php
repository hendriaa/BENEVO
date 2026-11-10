<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RoleMiddleware
{
    public function handle(Request $request, Closure $next, string $role): Response
    {
        $user = $request->user();

        if (!$user) {
            return redirect()->route('login');
        }

        if ($user->role !== $role) {
            // Jika admin membuka rute operator, arahkan ke dashboard admin
            if ($user->role === 'admin') {
                return redirect()->route('dashboard');
            }

            // Jika operator membuka rute admin, arahkan ke dashboard operator
            if ($user->role === 'operator') {
                return redirect()->route('operator.dashboard');
            }

            abort(403, 'Anda tidak punya akses ke halaman ini.');
        }

        return $next($request);
    }
}
