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
                    </div>

                    @if($page->slug=="terms")

                    <div class="row ">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="terms_en">Terms & Conditions (en) <span
                                        class="required">*</span></label>
                                <textarea type="text" class="form-control tinymce_advance" id="terms_en" name="terms_en"
                                    value="{{ old('terms_en') }}" required="">{{ $page->terms_en }}</textarea>
                            </div>

                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="terms_ar">Terms & Conditions (ar) <span
                                        class="required">*</span></label>
                                <textarea type="text" class="form-control tinymce_advance_ar" id="terms_ar"
                                    name="terms_ar" value="{{ old('terms_ar') }}"
                                    required="">{{ $page->terms_ar }}</textarea>
                            </div>

                        </div>
                    </div>
                    @endif

                    @if($page->slug=="privacy")

                    <div class="row ">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="privacy_en">Privacy policy (en) <span
                                        class="required">*</span></label>
                                <textarea type="text" class="form-control tinymce_advance" id="privacy_en"
                                    name="privacy_en" value="{{ old('privacy_en') }}"
                                    required="">{{ $page->privacy_en }}</textarea>
                            </div>

                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="privacy_ar">Privacy policy (ar) <span
                                        class="required">*</span></label>
                                <textarea type="text" class="form-control tinymce_advance_ar" id="privacy_ar"
                                    name="privacy_ar" value="{{ old('privacy_ar') }}"
                                    required="">{{ $page->privacy_ar }}</textarea>
                            </div>

                        </div>
                    </div>
                    @endif

                    @if($page->slug=="disclosure_policy")

                    <div class="row ">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="disclosure_policy_en">Disclosure policy (en) <span
                                        class="required">*</span></label>
                                <textarea type="text" class="form-control tinymce_advance" id="disclosure_policy_en"
                                    name="disclosure_policy_en" value="{{ old('disclosure_policy_en') }}"
                                    required="">{{ $page->disclosure_policy_en }}</textarea>
                            </div>

                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="disclosure_policy_ar">Disclosure policy (ar) <span
                                        class="required">*</span></label>
                                <textarea type="text" class="form-control tinymce_advance_ar" id="disclosure_policy_ar"
                                    name="disclosure_policy_ar" value="{{ old('disclosure_policy_ar') }}"
                                    required="">{{ $page->disclosure_policy_ar }}</textarea>
                            </div>

                        </div>
                    </div>
                    @endif

                    <div class="row ">


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

                        @if($page->slug=="index")
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