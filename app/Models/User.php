<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    // Primary key tabel kita bukan "id", tapi "user_id"
    protected $primaryKey = 'user_id';

    protected $fillable = [
        'name',
        'email',
        'phone',
        'password_hash',
        'role',
        'is_active',
    ];

    protected $hidden = [
        'password_hash',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];

    // Kasih tahu Laravel: password ada di kolom "password_hash"
    public function getAuthPassword()
    {
        return $this->password_hash;
    }

    // Tabel users kita tidak punya kolom remember_token
    public function getRememberTokenName()
    {
        return '';
    }
}
