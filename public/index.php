<?php

use Illuminate\Http\Request;

define('LARAVEL_START', microtime(true));

// Paksa request untuk dideteksi sebagai HTTPS ketika berada di lingkungan proxy Render
if ((isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') || getenv('RENDER') || isset($_ENV['RENDER'])) {
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
