<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Setting;
use Illuminate\Support\Facades\DB;

class SettingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $lang = $request->input('lang') == 'ar' ? 'ar' : 'en';
        $key = $request->lang == 'ar' ? 'footer_ar' : 'footer_en';
      
        $setting = Setting::orderBy('id', 'asc')
        ->where('group', 'general')
        ->where('name', $key)
        ->get(['id', 'payload']);
        if ($setting->count() === 0) {
            return response()->json(['status' => 0, 'data' => 'Resource not found'], 404);
        }

        return response()->json(['status' => 1, 'data' => $setting], 200);
    }
}
