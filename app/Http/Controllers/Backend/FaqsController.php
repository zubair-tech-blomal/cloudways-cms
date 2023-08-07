<?php

namespace App\Http\Controllers\Backend;

use App\Helpers\StringHelper;
use App\Helpers\UploadHelper;
use App\Http\Controllers\Controller;
use App\Models\Track;
use Illuminate\Http\Request;
use App\Models\Faq;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class FaqsController extends Controller
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
        if (is_null($this->user) || !$this->user->can('faq.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        if (request()->ajax()) {
            if ($isTrashed) {
                $faqs = Faq::orderBy('id', 'asc')
                    ->where('status', 0)
                    ->get();
            } else {
                $faqs = Faq::orderBy('id', 'asc')
                    ->where('deleted_at', null)
                    ->where('status', 1)
                    ->get();
            }

            $datatable = DataTables::of($faqs, $isTrashed)
                ->addIndexColumn()
                ->addColumn(
                    'action',
                    function ($row) use ($isTrashed) {
                        $csrf = "" . csrf_field() . "";
                        $method_delete = "" . method_field("delete") . "";
                        $method_put = "" . method_field("put") . "";
                        $html = '<a class="btn waves-effect waves-light btn-info btn-sm btn-circle" title="View Blog Details" href="' . route('admin.faqs.show', $row->id) . '"><i class="fa fa-eye"></i></a>';

                        if ($row->deleted_at === null) {
                            $deleteRoute =  route('admin.faqs.destroy', [$row->id]);
                            if ($this->user->can('faq.edit')) {
                                $html .= '<a class="btn waves-effect waves-light btn-success btn-sm btn-circle ml-1 " title="Edit Blog Details" href="' . route('admin.faqs.edit', $row->id) . '"><i class="fa fa-edit"></i></a>';
                            }
                            if ($this->user->can('faq.delete')) {
                                $html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-1 text-white" title="Delete Admin" id="deleteItem' . $row->id . '"><i class="fa fa-trash"></i></a>';
                            }
                        } else {
                            if ($this->user->can('faq.delete')) {
                                $deleteRoute =  route('admin.faqs.trashed.destroy', [$row->id]);
                                $revertRoute = route('admin.faqs.trashed.revert', [$row->id]);

                                $html .= '<a class="btn waves-effect waves-light btn-warning btn-sm btn-circle ml-1" title="Revert Back" id="revertItem' . $row->id . '"><i class="fa fa-check"></i></a>';
                                $html .= '
                                <form id="revertForm' . $row->id . '" action="' . $revertRoute . '" method="post" style="display:none">' . $csrf . $method_put . '
                                    <button type="submit" class="btn waves-effect waves-light btn-rounded btn-success"><i
                                            class="fa fa-check"></i> Confirm Revert</button>
                                    <button type="button" class="btn waves-effect waves-light btn-rounded btn-secondary" data-dismiss="modal"><i
                                            class="fa fa-times"></i> Cancel</button>
                                </form>';
                                $html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-1 text-white" title="Delete Blog Permanently" id="deleteItemPermanent' . $row->id . '"><i class="fa fa-trash"></i></a>';
                            }
                        }

                        if ($this->user->can('faq.delete')) {
                            $html .= '<script>
                            $("#deleteItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Faq will be deleted as trashed !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deleteForm' . $row->id . '").submit();}})
                            });
                        </script>';

                            $html .= '<script>
                            $("#deleteItemPermanent' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Faq will be deleted permanently, both from trash !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deletePermanentForm' . $row->id . '").submit();}})
                            });
                        </script>';

                            $html .= '<script>
                            $("#revertItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Faq will be revert back from trash !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, Revert Back!"
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
                ->editColumn('image', function ($row) {
                    if ($row->image != null) {
                        return "<img src='" . asset('public/assets/images/blogs/' . $row->image) . "' class='img img-display-list' />";
                    }
                    return '-';
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
            $rawColumns = ['action', 'title', 'status', 'image'];
            return $datatable->rawColumns($rawColumns)
                ->make(true);
        }

        $count_faqs = count(Faq::select('id')->get());
        $count_active_faqs = count(Faq::select('id')->where('status', 1)->get());
        $count_trashed_faqs = count(Faq::select('id')->where('deleted_at', '!=', null)->get());
        return view('backend.pages.blogs.index', compact('count_faqs', 'count_active_faqs', 'count_trashed_faqs'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (is_null($this->user) || !$this->user->can('faq.create')) {
            return abort(403, 'You are not allowed to access this page !');
        }

        return view('backend.pages.blogs.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (is_null($this->user) || !$this->user->can('faq.create')) {
            return abort(403, 'You are not allowed to access this page !');
        }

        $request->validate([
            // 'title'  => 'required|max:100',
            'slug'  => 'nullable|max:100|unique:pages,slug',
            'image'  => 'nullable|image'
        ]);

        try {
            DB::beginTransaction();
            $faq = new Faq();
            $faq->question_en = $request->question_en;
            $faq->answer_en = $request->answer_en;
            $faq->question_ar = $request->question_ar;
            $faq->answer_ar = $request->answer_ar;
            $faq->sort = $request->sort;

            if ($request->slug) {
                $faq->slug = $request->slug;
            } else {
                $faq->slug = StringHelper::createSlug($request->question_en, 'Faq', 'slug', '');
            }

           
            $faq->status = $request->status;
            $faq->created_at = Carbon::now();
            $faq->created_by = Auth::id();
            $faq->updated_at = Carbon::now();
            $faq->save();

            Track::newTrack($faq->question_en, 'New Faq has been created');
            DB::commit();
            session()->flash('success', 'New Faq has been created successfully !!');
            return redirect()->route('admin.faqs.index');
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
        if (is_null($this->user) || !$this->user->can('faq.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $blog = Faq::find($id);
        return view('backend.pages.blogs.show', compact('blog'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (is_null($this->user) || !$this->user->can('faq.edit')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $blog = Faq::find($id);
        return view('backend.pages.blogs.edit', compact('blog'));
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
        if (is_null($this->user) || !$this->user->can('faq.edit')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $faq = Faq::find($id);
        if (is_null($faq)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.faqs.index');
        }

        // $request->validate([
        //     'slug'  => 'required|max:100|unique:pages,slug,' . $faq->id,
        // ]);

        try {
            DB::beginTransaction();
            $faq->question_en = $request->question_en;
            $faq->answer_en = $request->answer_en;
            $faq->question_ar = $request->question_ar;
            $faq->answer_ar = $request->answer_ar;
            $faq->status = $request->status;
            $faq->sort = $request->sort;
            $faq->updated_by = Auth::id();
            $faq->updated_at = Carbon::now();
            $faq->save();

            Track::newTrack($faq->question_en, 'Faq has been updated successfully !!');
            DB::commit();
            session()->flash('success', 'FAq has been updated successfully !!');
            return redirect()->route('admin.faqs.index');
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
        if (is_null($this->user) || !$this->user->can('faq.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $blog = Faq::find($id);
        if (is_null($blog)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.faqs.trashed');
        }
        $blog->deleted_at = Carbon::now();
        $blog->deleted_by = Auth::id();
        $blog->status = 0;
        $blog->save();

        session()->flash('success', 'FAq has been deleted successfully as trashed !!');
        return redirect()->route('admin.faqs.trashed');
    }

    /**
     * revertFromTrash
     *
     * @param integer $id
     * @return Remove the item from trash to active -> make deleted_at = null
     */
    public function revertFromTrash($id)
    {
        if (is_null($this->user) || !$this->user->can('faq.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $blog = Faq::find($id);
        if (is_null($blog)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.faqs.trashed');
        }
        $blog->deleted_at = null;
        $blog->deleted_by = null;
        $blog->save();

        session()->flash('success', 'Faq has been revert back successfully !!');
        return redirect()->route('admin.faqs.trashed');
    }

    /**
     * destroyTrash
     *
     * @param integer $id
     * @return void Destroy the data permanently
     */
    public function destroyTrash($id)
    {
        if (is_null($this->user) || !$this->user->can('faq.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $blog = Faq::find($id);
        if (is_null($blog)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.faqs.trashed');
        }

        // Remove Image
        UploadHelper::deleteFile('public/assets/images/blogs/' . $blog->image);

        // Delete Blog permanently
        $blog->delete();

        session()->flash('success', 'Faq has been deleted permanently !!');
        return redirect()->route('admin.faqs.trashed');
    }

    /**
     * trashed
     *
     * @return view the trashed data list -> which data status = 0 and deleted_at != null
     */
    public function trashed()
    {
        if (is_null($this->user) || !$this->user->can('faq.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        return $this->index(true);
    }
}
