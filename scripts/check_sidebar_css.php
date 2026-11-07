<?php
$viewsDir = 'd:/laragon/www/BENEVO/resources/views';
$files = [
    'dashboard.blade.php',
    'rekapitulasi-dana.blade.php',
    'manajemen-kampanye.blade.php',
    'donatur.blade.php',
    'kelola-akun-operator.blade.php'
];

foreach ($files as $f) {
    $c = file_get_contents($viewsDir . '/' . $f);
    if (preg_match('/\.sidebar\s*\{([^}]+)\}/', $c, $m)) {
        echo "=== $f ===\n" . trim($m[1]) . "\n\n";
    }
}

