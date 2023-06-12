<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Modules\Article\Entities\Page;
class PageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //return "ok..";
        //$posts = Post::all();

        $lang = $request->input('lang') == 'ar' ? 'ar' : 'en';
        $slug = $request->input('slug');

        $page = Page::where("status", 1)->where("slug", $slug)->first();


        // $banner_title = $page->banner_title_.$lang;
        // return $banner_title;

        if($page){
            $response_details = [
                'slug' => $page->slug,
                'banner_title' => $page->banner_title_en   
            ];
        
            return response()->json($response_details, 200);
        }
        
        return response()->json(['data' => 'Resource not found'], 404);
    }

    // public function getLanguage($lang)
    // {
    //    $lang =  $lang == 'ar' ? 'ar' : 'en' ;
       
    //     if ($lang == "ar") {
    //         $lang = 'ar';
    //     }else{
    //         $lang = 'en';
    //     }
       
    //     return $lang;
    // }
}
