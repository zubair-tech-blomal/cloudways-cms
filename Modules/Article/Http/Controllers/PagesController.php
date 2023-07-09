<?php

namespace Modules\Article\Http\Controllers;

use App\Helpers\StringHelper;
use App\Helpers\UploadHelper;
use App\Http\Controllers\Controller;
use Modules\Article\Entities\ArticleType;
use Modules\Article\Entities\Category;
use App\Models\Track;
use Illuminate\Http\Request;
use Modules\Article\Entities\Page;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class PagesController extends Controller
{
    public $user;

    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $this->user = Auth::user();
            return $next($request);
        });
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($isTrashed = false)
    {
        if (is_null($this->user) || !$this->user->can('page.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        if (request()->ajax()) {
            if ($isTrashed) {
                $pages = Page::orderBy('id', 'asc')
                    ->where('status', 0)
                    ->get();
            } else {
                $pages = Page::orderBy('id', 'asc')
                    ->where('deleted_at', null)
                    //->where('status', 1)
                    ->get();
            }

            $datatable = DataTables::of($pages, $isTrashed)
                ->addIndexColumn()
                ->addColumn(
                    'action',
                    function ($row) use ($isTrashed) {
                        $csrf = "" . csrf_field() . "";
                        $method_delete = "" . method_field("delete") . "";
                        $method_put = "" . method_field("put") . "";
                        $html = '<a class="btn waves-effect waves-light btn-info btn-sm btn-circle" title="View Page Details" href="' . route('admin.pages.show', $row->id) . '"><i class="fa fa-eye"></i></a>';

                        if ($row->deleted_at === null) {
                            $deleteRoute =  route('admin.pages.destroy', [$row->id]);
                            if ($this->user->can('page.edit')) {
                                $html .= '<a class="btn waves-effect waves-light btn-success btn-sm btn-circle ml-1 " title="Edit Page Details" href="' . route('admin.pages.edit', $row->id) . '"><i class="fa fa-edit"></i></a>';
                            }
                            // if ($this->user->can('page.delete')) {
                            //     $html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-1 text-white" title="Delete Admin" id="deleteItem' . $row->id . '"><i class="fa fa-trash"></i></a>';
                            // }
                        } else {
                            $deleteRoute =  route('admin.pages.trashed.destroy', [$row->id]);
                            $revertRoute = route('admin.pages.trashed.revert', [$row->id]);

                            if ($this->user->can('page.delete')) {
                                $html .= '<a class="btn waves-effect waves-light btn-warning btn-sm btn-circle ml-1" title="Revert Back" id="revertItem' . $row->id . '"><i class="fa fa-check"></i></a>';
                                $html .= '
                                <form id="revertForm' . $row->id . '" action="' . $revertRoute . '" method="post" style="display:none">' . $csrf . $method_put . '
                                    <button type="submit" class="btn waves-effect waves-light btn-rounded btn-success"><i
                                            class="fa fa-check"></i> Confirm Revert</button>
                                    <button type="button" class="btn waves-effect waves-light btn-rounded btn-secondary" data-dismiss="modal"><i
                                            class="fa fa-times"></i> Cancel</button>
                                </form>';
                                //$html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-1 text-white" title="Delete Page Permanently" id="deleteItemPermanent' . $row->id . '"><i class="fa fa-trash"></i></a>';
                            }
                        }



                        $html .= '<script>
                            $("#deleteItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Page will be deleted as trashed !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deleteForm' . $row->id . '").submit();}})
                            });
                        </script>';

                        if ($this->user->can('page.delete')) {
                            $html .= '<script>
                            $("#deleteItemPermanent' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Page will be deleted permanently, both from trash !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deletePermanentForm' . $row->id . '").submit();}})
                            });
                        </script>';

                            $html .= '<script>
                            $("#revertItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Page will be revert back from trash !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, Revert Back!"
                                }).then((result) => { if (result.value) {$("#revertForm' . $row->id . '").submit();}})
                            });
                        </script>';

                            $html .= '
                            <form id="deleteForm' . $row->id . '" action="' . $deleteRoute . '" method="post" style="display:none">' . $csrf . $method_delete . '
                                <button type="submit" class="btn waves-effect waves-light btn-rounded btn-success"><i
                                        class="fa fa-check"></i> Confirm Delete</button>
                                <button type="button" class="btn waves-effect waves-light btn-rounded btn-secondary" data-dismiss="modal"><i
                                        class="fa fa-times"></i> Cancel</button>
                            </form>';

                            $html .= '
                            <form id="deletePermanentForm' . $row->id . '" action="' . $deleteRoute . '" method="post" style="display:none">' . $csrf . $method_delete . '
                                <button type="submit" class="btn waves-effect waves-light btn-rounded btn-success"><i
                                        class="fa fa-check"></i> Confirm Permanent Delete</button>
                                <button type="button" class="btn waves-effect waves-light btn-rounded btn-secondary" data-dismiss="modal"><i
                                        class="fa fa-times"></i> Cancel</button>
                            </form>';
                        }
                        return $html;
                    }
                )

                ->editColumn('title', function ($row) {
                    return $row->title;
                })
                ->editColumn('banner_image', function ($row) {
                    if ($row->banner_image != null) {
                        return "<img src='" . asset('public/assets/images/pages/' . $row->banner_image) . "' class='img img-display-list' />";
                    }
                    return '-';
                })
                ->editColumn('image', function ($row) {
                    if ($row->image != null) {
                        return "<img src='" . asset('public/assets/images/pages/' . $row->image) . "' class='img img-display-list' />";
                    }
                    return '-';
                })
                ->addColumn('category', function ($row) {
                    $html = "";
                    $category = Category::find($row->category_id);
                    if (!is_null($category)) {
                        $html .= "<span>" . $category->name . "</span>";
                    } else {
                        $html .= "-";
                    }
                    return $html;
                })
                ->editColumn('status', function ($row) {
                    if ($row->status) {
                        return '<span class="badge badge-success font-weight-100">Active</span>';
                    } else if ($row->deleted_at != null) {
                        return '<span class="badge badge-danger">Trashed</span>';
                    } else {
                        return '<span class="badge badge-warning">Inactive</span>';
                    }
                });
            $rawColumns = ['action', 'title', 'status', 'category', 'banner_image', 'image'];
            return $datatable->rawColumns($rawColumns)
                ->make(true);
        }

        $count_pages = count(Page::select('id')->get());
        $count_active_pages = count(Page::select('id')->where('status', 1)->get());
        $count_trashed_pages = count(Page::select('id')->where('deleted_at', '!=', null)->get());
        return view('article::pages.index', compact('count_pages', 'count_active_pages', 'count_trashed_pages'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::printCategory(null, 3);
        $article_types = ArticleType::all();
        return view('article::pages.create', compact('categories', 'article_types'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (is_null($this->user) || !$this->user->can('page.create')) {
            return abort(403, 'You are not allowed to access this page !');
        }

        $request->validate([
            'title'  => 'required|max:100',
            'slug'  => 'nullable|max:100|unique:pages,slug',
            'description'  => 'required',
            'who_we_are_ar'  => 'required',
            'our_mission_en'  => 'required',
            'our_mission_ar'  => 'required',
            'our_vision_en'  => 'required',
            'our_vision_ar'  => 'required',
        ]);

        try {
            DB::beginTransaction();
            $page = new Page();
            $page->title = $request->title;
            $page->banner_title_en = $request->banner_title_en;
            $page->banner_title_ar = $request->banner_title_ar;
            $page->banner_description_en = $request->banner_description_en;
            $page->banner_description_ar = $request->banner_description_ar;
            if ($request->slug) {
                $page->slug = $request->slug;
            } else {
                $page->slug = StringHelper::createSlug($request->title, 'Modules\Article\Entities\Page', 'slug', '-', true);
            }

            // if (!is_null($request->banner_image)) {
            //     $page->banner_image = UploadHelper::upload('banner_image', $request->banner_image, $request->title . '-' . time() . '-banner', 'public/assets/images/pages');
            // }

            // if (!is_null($request->image)) {
            //     $page->image = UploadHelper::upload('image', $request->image, $request->title . '-' . time() . '-logo', 'public/assets/images/pages');
            // }

            // $page->category_id = $request->category_id;
            // $page->article_type_id = $request->article_type_id;
            $page->status = $request->status;

            $page->description = $request->description;
            $page->who_we_are_ar = $request->who_we_are_ar;

            $page->our_vision_en = $request->our_vision_en;
            $page->our_vision_ar = $request->our_vision_ar;

            $page->our_mission_en = $request->our_mission_en;
            $page->our_mission_ar = $request->our_mission_ar;


            $page->meta_description = $request->meta_description;
            $page->meta_description_ar = $request->meta_description_ar;
            $page->created_at = Carbon::now();
            $page->created_by = Auth::id();
            $page->updated_at = Carbon::now();
            $page->save();

            Track::newTrack($page->title, 'New Page has been created');
            DB::commit();
            session()->flash('success', 'New Page has been created successfully !!');
            return redirect()->route('admin.pages.index');
        } catch (\Exception $e) {
            session()->flash('sticky_error', $e->getMessage());
            DB::rollBack();
            return back();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        if (is_null($this->user) || !$this->user->can('page.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $page = Page::find($id);
        $categories = DB::table('categories')->select('id', 'name')->get();
        if($page->slug=="terms" || $page->slug=="privacy" || $page->slug=="disclosure_policy" || $page->slug=="footer")
        {
            return view('article::pages.termsandprivacy.show', compact('categories', 'page'));
        }
       
        return view('article::pages.show', compact('categories', 'page'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (is_null($this->user) || !$this->user->can('page.edit')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $page = Page::find($id);
        $categories = Category::printCategory($page->category_id);
        $article_types = ArticleType::all();
        if($page->slug=="terms" || $page->slug=="privacy" || $page->slug=="disclosure_policy" || $page->slug=="footer")
        {
           
            return view('article::pages.termsandprivacy.edit', compact('categories', 'page', 'article_types'));

        }
        return view('article::pages.edit', compact('categories', 'page', 'article_types'));
        //return $page;
        // if ($page->slug == "home") {
        //     return view('article::pages.edit', compact('categories', 'page', 'article_types'));
        // }else{
        //     return view('article::pages.edit', compact('categories', 'page', 'article_types'));

        // }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        
        if (is_null($this->user) || !$this->user->can('page.edit')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $page = Page::find($id);
        if (is_null($page)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.pages.index');
        }
        // return $page->slug;
        if ($page->slug == "about") {
            $request->validate([
                'title'  => 'required|max:100',
                // 'slug'  => 'required|max:100|unique:pages,slug,' . $page->id,
                'description'  => 'required',
                'who_we_are_ar'  => 'required',
                'our_mission_en'  => 'required',
                'our_mission_ar'  => 'required',
                'our_vision_en'  => 'required',
                'our_vision_ar'  => 'required',
            ]);
        }

        if ($page->slug == "terms") {
            $request->validate([
                'terms_en'  => 'required',
                'terms_ar'  => 'required',
            ]);
        }

        if ($page->slug == "privacy") {
            $request->validate([
                'privacy_en'  => 'required',
                'privacy_ar'  => 'required',
            ]);
        }

        if ($page->slug == "disclosure_policy") {
            $request->validate([
                'disclosure_policy_en'  => 'required',
                'disclosure_policy_ar'  => 'required',
            ]);
        }

        if ($page->slug == "footer") {
            $request->validate([
                'description'  => 'required',
                'footer_ar'  => 'required',
            ]);
        }

        if ($page->slug == "index" || $page->slug == "investment" ||  $page->slug == "faqs" || $page->slug == "terms" || $page->slug=="privacy" || $page->slug=="disclosure_policy") {
            $request->validate([
                'title'  => 'required|max:100',
            ]);
        }


            try {
                DB::beginTransaction();
                $page->title = $request->title;

                $page->banner_title_en = $request->banner_title_en;
                $page->banner_title_ar = $request->banner_title_ar;

                $page->banner_description_en = $request->banner_description_en;
                $page->banner_description_ar = $request->banner_description_ar;

                $page->status = $request->status;
                if ($page->slug == "about") {
                    $page->description = $request->description;
                    $page->who_we_are_ar = $request->who_we_are_ar;

                    $page->our_vision_en = $request->our_vision_en;
                    $page->our_vision_ar = $request->our_vision_ar;

                    $page->our_mission_en = $request->our_mission_en;
                    $page->our_mission_ar = $request->our_mission_ar;
                } 
                else if ($page->slug == "investment") {
                    $page->description = $request->description;
                    $page->investment_description_ar = $request->investment_description_ar;
                }

                else if ($page->slug == "terms") {
                    $page->terms_en = $request->terms_en;
                    $page->terms_ar = $request->terms_ar;
                }

                else if ($page->slug == "privacy") {
                    $page->privacy_en = $request->privacy_en;
                    $page->privacy_ar = $request->privacy_ar;
                }

                else if ($page->slug == "disclosure_policy") {
                    $page->disclosure_policy_en = $request->disclosure_policy_en;
                    $page->disclosure_policy_ar = $request->disclosure_policy_ar;
                }
                else if ($page->slug == "footer") {
                    $page->description = $request->description;
                    $page->footer_ar = $request->footer_ar;
                }

                $page->meta_description = $request->meta_description;
                $page->meta_description_ar = $request->meta_description_ar;

                $page->updated_by = Auth::id();
                $page->updated_at = Carbon::now();
                $page->save();

                Track::newTrack($page->title, 'Page has been updated successfully !!');
                DB::commit();
                session()->flash('success', 'Page has been updated successfully !!');
                return redirect()->route('admin.pages.index');
            } catch (\Exception $e) {
                session()->flash('sticky_error', $e->getMessage());
                DB::rollBack();
                return back();
            }
        
    }



    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (is_null($this->user) || !$this->user->can('page.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $page = Page::find($id);
        if (is_null($page)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.pages.trashed');
        }
        $page->deleted_at = Carbon::now();
        $page->deleted_by = Auth::id();
        $page->status = 0;
        $page->save();

        session()->flash('success', 'Page has been deleted successfully as trashed !!');
        return redirect()->route('admin.pages.trashed');
    }

    /**
     * revertFromTrash
     *
     * @param integer $id
     * @return Remove the item from trash to active -> make deleted_at = null
     */
    public function revertFromTrash($id)
    {
        if (is_null($this->user) || !$this->user->can('page.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $page = Page::find($id);
        if (is_null($page)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.pages.trashed');
        }
        $page->deleted_at = null;
        $page->deleted_by = null;
        $page->save();

        session()->flash('success', 'Page has been revert back successfully !!');
        return redirect()->route('admin.pages.trashed');
    }

    /**
     * destroyTrash
     *
     * @param integer $id
     * @return void Destroy the data permanently
     */
    public function destroyTrash($id)
    {
        if (is_null($this->user) || !$this->user->can('page.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $page = Page::find($id);
        if (is_null($page)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.pages.trashed');
        }

        // Remove Images
        UploadHelper::deleteFile('public/assets/images/pages/' . $page->banner_image);
        UploadHelper::deleteFile('public/assets/images/pages/' . $page->image);

        // Delete Page permanently
        $page->delete();

        session()->flash('success', 'Page has been deleted permanently !!');
        return redirect()->route('admin.pages.trashed');
    }

    /**
     * trashed
     *
     * @return view the trashed data list -> which data status = 0 and deleted_at != null
     */
    public function trashed()
    {
        if (is_null($this->user) || !$this->user->can('page.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        return $this->index(true);
    }
}
