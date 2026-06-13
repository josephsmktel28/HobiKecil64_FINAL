<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;

class ForceHttps
{
    public function handle(Request $request, Closure $next)
    {
        // Di production, paksa semua URL yang di-generate Laravel menggunakan HTTPS
        if (!app()->environment('local')) {
            URL::forceScheme('https');
            
            // Force the request to be seen as secure
            $request->server->set('HTTPS', 'on');
        }

        return $next($request);
    }
}
