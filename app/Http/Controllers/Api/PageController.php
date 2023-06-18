<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Modules\Article\Entities\Page;
use Modules\Article\Entities\Category;
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
            if($lang == 'ar')
            {
                $banner_title = $page->banner_title_ar;
                $banner_description = $page->banner_description_ar;
                $meta_description = $page->meta_description_ar;
            }else{
                $banner_title = $page->banner_title_en;
                $banner_description = $page->banner_description_en;
                $meta_description = $page->meta_description;


            }

            $why_blomal = Category::orderBy('id', 'asc')
            ->where('deleted_at', null)
            ->where('status', 1)
            ->where('parent_category_id', 1)
            ->get();

            $how_it_works = Category::orderBy('id', 'asc')
            ->where('deleted_at', null)
            ->where('status', 1)
            ->where('parent_category_id', 6)
            ->get();

            $our_partners = Category::orderBy('id', 'asc')
            ->where('deleted_at', null)
            ->where('status', 1)
            ->where('parent_category_id', 11)
            ->get();

            $response_details = [
                'status' => 1,
                'slug' => $page->slug,
                'banner_title' => $banner_title,  
                'banner_description' => $banner_description,  
                'meta_description' => $meta_description ,
                'why_blomal' =>  $why_blomal,
                'how_it_works' =>  $how_it_works,
                'our_partners' =>  $our_partners
            ];

            // $categories = Category::orderBy('id', 'desc')
            // ->where('deleted_at', null)
            // ->where('status', 1)
            // ->where('parent_category_id', 1)
            // ->get();
            // return $categories;
            
           


            return response()->json($response_details, 200);
        }
        
        return response()->json(['status'=> 0, 'data' => 'Resource not found'], 404);
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
