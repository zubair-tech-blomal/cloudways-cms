<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Faq;
use Illuminate\Support\Facades\DB;

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
        $searchText = $request->search;
        $question = "";
        $answer = "";
        $question = $request->lang == 'ar' ? 'question_ar' : 'question_en';


        $faq = Faq::where('deleted_at', null)
            ->where('status', 1)
            ->where($question, 'LIKE', "%{$searchText}%")
            ->orderBy('sort', 'ASC')
            ->get();
        if ($faq->count() === 0) {
            return response()->json(['status' => 0, 'data' => 'Resource not found'], 404);
        }

        return response()->json(['status' => 1, 'data' => $faq], 200);
    }
}
