<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('users')->updateOrInsert(
            ['email' => 'admin@benevo.org'],
            [
                'name' => 'Harry Vaughan',
                'password_hash' => Hash::make('password123'),
                'role' => 'admin',
                'is_active' => 1,
            ]
        );

        DB::table('users')->updateOrInsert(
            ['email' => 'operator@benevo.org'],
            [
                'name' => 'Operator Benevo',
                'password_hash' => Hash::make('password123'),
                'role' => 'operator',
                'is_active' => 1,
            ]
        );
    }
}
