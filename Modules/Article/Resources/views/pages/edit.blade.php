@extends('backend.layouts.master')

@section('title')
@include('article::pages.partials.title')
@endsection

@section('admin-content')
@include('article::pages.partials.header-breadcrumbs')
<div class="container-fluid">
    @include('backend.layouts.partials.messages')
    <div class="create-page">
        <form action="{{ route('admin.pages.update', $page->id) }}" method="POST" enctype="multipart/form-data"
            data-parsley-validate data-parsley-focus="first">
            @csrf
            @method('put')
            <div class="form-body">
                <div class="card-body">
                    <div class="row ">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="title">Article Title <span
                                        class="required">*</span></label>
                                <input type="text" class="form-control" id="title" name="title"
                                    value="{{ $page->title }}" placeholder="Enter Title" required="" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label" for="slug">Banner Title (en) <span
                                        class="required">*</span></label>
                                <input type="text" class="form-control" id="banner_title_en" name="banner_title_en"
                                    value="{{ $page->banner_title_en }}" placeholder="Enter banner title" required="" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="control-label" for="slug">Banner Title (ar) <span
                                        class="required">*</span></label>
                                <input type="text" dir="rtl" class="form-control" id="banner_title_ar"
                                    name="banner_title_ar" value="{{ $page->banner_title_ar }}"
                                    placeholder="Enter banner title ar" required="" />
                            </div>
                        </div>

                    </div>
                    <div class="row ">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="banner_description_en">Banner Description (en) <span
                                        class="required">*</span></label>
                                <textarea type="text" class="form-control" id="banner_description_en"
                                    name="banner_description_en" value="{{ $page->banner_description_en }}"
                                    required="">{{ $page->banner_description_en }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="banner_description_ar">Banner Description (ar) <span
                                        class="required">*</span></label>
                                <textarea type="text" dir="rtl" class="form-control" id="banner_description_ar"
                                    name="banner_description_ar" value="{{$page->banner_description_ar}}"
                                    required="">{{$page->banner_description_ar}}</textarea>
                            </div>
                        </div>
                    </div>
                    @if($page->slug=="investment")
                    <div class="row ">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="description">Description (en) <span
                                        class="required">*</span></label>
                                <textarea type="text" class="form-control" id="description" name="description"
                                    value="{{ $page->description }}" required="">{{ $page->description }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="investment_description_ar">Description (ar)<span
                                        class="required">*</span></label>
                                <textarea type="text" dir="rtl" class="form-control" id="investment_description_ar"
                                    name="investment_description_ar" value="{{ $page->investment_description_ar }}"
                                    required="">{{ $page->investment_description_ar }}</textarea>
                            </div>
                        </div>
                    </div>
                    @endif
                    @if($page->slug=="terms")
                    <div class="row ">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="terms_en">Terms & Conditions (en) </label>
                                <textarea type="text" class="form-control tinymce_advance" id="terms_en"
                                    name="terms_en" value="{{ old('terms_en') }}" required="">{{ $page->terms_en }}</textarea>
                            </div>
                            
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="terms_ar">Terms & Conditions (ar) </label>
                                <textarea type="text" dir="rtl" class="form-control tinymce_advance" id="terms_ar"
                                    name="terms_ar" value="{{ old('terms_ar') }}" required="">{{ $page->terms_ar }}</textarea>
                            </div>
                            
                        </div>
                    </div>
                    @endif
                    <!-- about us content -->
                    @if($page->slug=="about-us")


                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="description">Who we are (en) <span
                                        class="required">*</span></label>
                                <textarea type="text" class="form-control" id="description" name="description"
                                    value="{{ $page->description }}" required="">{{ $page->description }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="who_we_are_en">Who we are (ar) <span
                                        class="required">*</span></label>
                                <textarea type="text" dir="rtl" class="form-control" id="who_we_are_ar"
                                    name="who_we_are_ar" value="{{ $page->who_we_are_ar }}"
                                    required="">{{ $page->who_we_are_ar }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="our_mission_en">Our Mission (en) <span
                                        class="required">*</span></label>
                                <textarea type="text" class="form-control" id="our_mission_en" name="our_mission_en"
                                    value="{{ $page->our_mission_en }}"
                                    required="">{{ $page->our_mission_en }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="our_mission_ar">Our Mission (ar) <span
                                        class="required">*</span></label>
                                <textarea type="text" dir="rtl" class="form-control" id="our_mission_ar"
                                    name="our_mission_ar" value="{{ $page->our_mission_ar }}"
                                    required="">{{ $page->our_mission_ar }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="our_vision_en">Our Vision (en) <span
                                        class="required">*</span></label>
                                <textarea type="text" class="form-control" id="our_vision_en" name="our_vision_en"
                                    value="{{ $page->our_vision_en }}" required="">{{ $page->our_vision_en }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="our_vision_ar">Our Vision (ar) <span
                                        class="required">*</span></label>
                                <textarea type="text" dir="rtl" class="form-control" id="our_vision_ar"
                                    name="our_vision_ar" value="{{ $page->our_vision_ar }}"
                                    required="">{{ $page->our_vision_ar }}</textarea>
                            </div>
                        </div>
                    </div>
                    @endif


                    <!-- end of about us content -->

                    <div class="row ">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="meta_description">Article Meta Description (en) <span
                                        class="optional">(optional)</span></label>
                                <textarea type="text" class="form-control" id="meta_description" name="meta_description"
                                    value="{{ $page->meta_description }}"
                                    placeholder="Meta description for SEO">{{ $page->meta_description }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label" for="meta_description_ar">Article Meta Description (ar)
                                    <span class="optional">(optional)</span></label>
                                <textarea type="text" dir="rtl" class="form-control" id="meta_description_ar"
                                    name="meta_description_ar" value="{{ $page->meta_description_ar }}"
                                    placeholder="Meta description for SEO">{{ $page->meta_description_ar }}</textarea>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="col-md-3">
                                <div class="form-group has-success">
                                    <label class="control-label" for="status">Status <span
                                            class="required">*</span></label>
                                    <select class="form-control custom-select" id="status" name="status" required>
                                        <option value="1" {{ $page->status === 1 ? 'selected' : null }}>Active</option>
                                        <option value="0" {{ $page->status === 0 ? 'selected' : null }}>Inactive
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="card-body">
                                    <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i>
                                        Save</button>
                                    <a href="{{ route('admin.pages.index') }}" class="btn btn-dark">Cancel</a>
                                </div>
                            </div>
                        </div>

                        @if($page->slug=="home")
                        <div class="col-md-12">
                            <div class="form-actions">
                                <div class="card-body">
                                    <a href="{{ route('admin.categories.index') }}" class="btn btn-dark">Home Page
                                        Categories</a>
                                </div>
                            </div>
                        </div>
                        @endif
                    </div>

                </div>

            </div>
        </form>
    </div>
</div>
@endsection

@section('scripts')
<script>
    $(".categories_select").select2({
        placeholder: "Select a Category"
    });
</script>
@endsection