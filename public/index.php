<?php

use Illuminate\Http\Request;

define('LARAVEL_START', microtime(true));

// Paksa request untuk dideteksi sebagai HTTPS ketika berada di lingkungan server / bukan localhost
header('X-Debug-Render: V3_Active');
if (isset($_SERVER['HTTP_HOST']) && !str_contains($_SERVER['HTTP_HOST'], 'localhost') && !str_contains($_SERVER['HTTP_HOST'], '127.0.0.1')) {
    $_SERVER['HTTPS'] = 'on';
}

// Determine if the application is in maintenance mode...
if (file_exists($maintenance = __DIR__.'/../storage/framework/maintenance.php')) {
    require $maintenance;
}

// Register the Composer autoloader...
require __DIR__.'/../vendor/autoload.php';

// Bootstrap Laravel and handle the request...
(require_once __DIR__.'/../bootstrap/app.php')
    ->handleRequest(Request::capture());
