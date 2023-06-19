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
        $why_blomal = "";
        $how_it_works = "";
        $our_partners = "";
        $investment_opportunities = "";
        $description = "";
        $our_mission = "";
        $our_vision = "";
        $terms = "";
        $privacy = "";
        $disclosure_policy = "";

        $lang = $request->input('lang') == 'ar' ? 'ar' : 'en';
        $slug = $request->input('slug');

        $page = Page::where("status", 1)->where("slug", $slug)->first();

        if ($page) {
            if ($lang == 'ar') {
                $banner_title = $page->banner_title_ar;
                $banner_description = $page->banner_description_ar;
                if ($slug == "investment") {
                    $description = $page->investment_description_ar;
                } else if ($slug == "about") {
                    $description = $page->who_we_are_ar;
                    $our_mission = $page->our_mission_ar;
                    $our_vision = $page->our_vision_ar;
                }
                $meta_description = $page->meta_description_ar;
            } else {
                $banner_title = $page->banner_title_en;
                $banner_description = $page->banner_description_en;
                $description = $page->description;
                $meta_description = $page->meta_description;

                if ($slug == "about") {
                    $our_mission = $page->our_mission_en;
                    $our_vision = $page->our_vision_en;
                }
            }
            if ($slug == 'index') {
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
            } else if ($slug == 'investment') {
                $investment_opportunities = Category::orderBy('id', 'asc')
                    ->where('deleted_at', null)
                    ->where('status', 1)
                    ->where('parent_category_id', 19)
                    ->get();
            } else if ($slug == 'terms') {
                $terms = Page::orderBy('id', 'asc')
                    ->where('deleted_at', null)
                    ->where('status', 1)
                    ->where('slug', 'terms')
                    ->get(['terms_en', 'terms_ar']);

                $privacy = Page::orderBy('id', 'asc')
                    ->where('deleted_at', null)
                    ->where('status', 1)
                    ->where('slug', 'privacy')
                    ->get(['privacy_en', 'privacy_ar']);

                $disclosure_policy = Page::orderBy('id', 'asc')
                    ->where('deleted_at', null)
                    ->where('status', 1)
                    ->where('slug', 'disclosure_policy')
                    ->get(['disclosure_policy_en', 'disclosure_policy_ar']);
            }

            $response_details = [
                'status' => 1,
                'slug' => $page->slug,
                'banner_title' => $banner_title,
                'banner_description' => $banner_description,
                'description' => $description,
                'our_mission' =>  $our_mission,
                'our_vision' =>  $our_vision,
                'why_blomal' =>  $why_blomal,
                'how_it_works' =>  $how_it_works,
                'our_partners' =>  $our_partners,
                'invst_opportunities' => $investment_opportunities,
                'terms' => $terms,
                'privacy' => $privacy,
                'disclosure_policy' => $disclosure_policy,
                'meta_description' => $meta_description
            ];

            return response()->json($response_details, 200);
        }

        return response()->json(['status' => 0, 'data' => 'Resource not found'], 404);
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
