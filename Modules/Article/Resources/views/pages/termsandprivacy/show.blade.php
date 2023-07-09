@extends('backend.layouts.master')

@section('title')
@include('article::pages.partials.title')
@endsection

@section('admin-content')
@include('article::pages.partials.header-breadcrumbs')
<div class="container-fluid">
    @include('backend.layouts.partials.messages')
    <div class="create-page">
        <div class="form-body">
            <div class="card-body">
                @if($page->status==1)
                <div class="alert alert-success" role="alert">Active</div>
                @else
                <div class="alert alert-warning" role="alert">Inactive</div>
                @endif
                <div class="row ">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="title">Page Title</label>
                            <br>
                            {{ $page->title }}
                        </div>
                    </div>

                </div>
                @if($page->slug=="terms")    
                <div class="row ">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="terms_en">Terms & Conditions (en)</label>
                            <br>
                            <div>{!! $page->terms_en !!}</div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="terms_ar">Terms & Conditions (ar)</label>
                            <br>
                            <div dir="rtl" class="float-right">{!! $page->terms_ar !!}</div>
                        </div>
                    </div>
                </div>
                @endif

                @if($page->slug=="privacy")    
                <div class="row ">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="privacy_en">Privacy policy (en)</label>
                            <br>
                            <div>{!! $page->privacy_en !!}</div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="privacy_ar">Privacy policy (ar)</label>
                            <br>
                            <div dir="rtl" class="float-right">{!! $page->privacy_ar !!}</div>
                        </div>
                    </div>
                </div>
                @endif

                @if($page->slug=="disclosure_policy")    
                <div class="row ">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="disclosure_policy_en">Disclosure policy (en)</label>
                            <br>
                            <div>{!! $page->disclosure_policy_en !!}</div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="disclosure_policy_ar">Disclosure policy (ar)</label>
                            <br>
                            <div dir="rtl" class="float-right">{!! $page->disclosure_policy_ar !!}</div>
                        </div>
                    </div>
                </div>
                @endif

                @if($page->slug=="footer")    
                <div class="row ">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="description">Footer (en)</label>
                            <br>
                            <div>{!! $page->description !!}</div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="disclosure_policy_ar">Footer (ar)</label>
                            <br>
                            <div dir="rtl" class="float-right">{!! $page->footer_ar !!}</div>
                        </div>
                    </div>
                </div>
                @endif

            </div>


            <div class="row ">

                <div class="col-md-12">
                    <div class="form-actions">
                        <div class="card-body">
                            @if (Auth::user()->can('page.edit'))
                            <a class="btn btn-success" href="{{ route('admin.pages.edit', $page->id) }}"> <i
                                    class="fa fa-edit"></i> Edit Now</a>
                            @endif
                            <a href="{{ route('admin.pages.index') }}" class="btn btn-dark ml-2">Cancel</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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