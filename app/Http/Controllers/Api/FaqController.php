<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Faq;

class FaqController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $lang = $request->input('lang') == 'ar' ? 'ar' : 'en';
        $question = "";
        $answer = "";

        $faq = Faq::orderBy('id', 'asc')
        ->where('deleted_at', null)
        ->where('status', 1)
        ->get();
        if ($faq->count() === 0){
            return response()->json(['status' => 0, 'data' => 'Resource not found'], 404);
        }

        return response()->json(['status' => 1, 'data' => $faq], 200);
       
    }
}
