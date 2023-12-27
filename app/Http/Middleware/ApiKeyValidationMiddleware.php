<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class ApiKeyValidationMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle($request, Closure $next)
    {
        $token = $request->header('Authorization');

        if (!$token) {
            return response()->json(['status' => 0, 'data' => 'Unauthorized'], 401);
        }

        $token = str_replace('Bearer ', '', $token);

        $validApiKeys = [
            'eyJhbGciOiJIUzI1NiJ9.eyJSb2xlIjoiQWRtaW4iLCJJc3N1ZXIiOiJJc3N1ZXIiLCJVc2VybmFtZSI6IkphdmFJblVzZSIsImV4cCI6MTcwMzY2OTUxNiwiaWF0IjoxNzAzNjY5NTE2fQ.CyjAiqegl1RskstfoL4AfCKB4FJ3rD1gX3gI2jAOWnw',
        ];

        // Check if the received API key is valid
        if (in_array($token, $validApiKeys)) {
            return $next($request);
            //return response()->json(['valiud' => 'valid token'], 200);

        }

        return response()->json(['status' => 0, 'data' => 'Invalid token'], 401);
    }
}
