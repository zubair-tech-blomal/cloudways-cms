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


                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="banner_title_en">Banner Title (en)</label>
                            <br>
                            {{ $page->banner_title_en != null ? $page->banner_title_en : '-' }}
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="banner_title_ar">Banner Title (ar)</label>
                            <br>
                            {{ $page->banner_title_ar != null ? $page->banner_title_ar : '-' }}
                        </div>
                    </div>

                </div>

                <div class="row ">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="banner_description_en">Banner Description (en) </label>
                            <br>
                            <div>{{ $page->banner_description_en != null ? $page->banner_description_en : '-' }}</div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="banner_description_ar">Banner Description (ar) </label>
                            <br>
                            <div class="float-right">{{ $page->banner_description_ar != null ?
                                $page->banner_description_ar : '-' }}</div>
                        </div>
                    </div>
                </div>

                @if($page->slug=="investment")
                <div class="row ">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="description">Description (en) </label>
                            <br>
                            <div>{{ $page->description != null ? $page->description : '-' }}</div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="investment_description_ar">Description (ar) </label>
                            <br>
                            <div class="float-right">{{ $page->investment_description_ar != null ?
                                $page->investment_description_ar : '-' }}</div>
                        </div>
                    </div>
                </div>
                @endif


                @if($page->slug=="about")
                <div class="row ">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="description">Who we are (en) </label>
                            <br>
                            <div>{{ $page->description != null ? $page->description : '-' }}</div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="who_we_are_ar">Who we are (ar) </label>
                            <br>
                            <div class="float-right">{{ $page->who_we_are_ar != null ? $page->who_we_are_ar : '-' }}
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row ">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="our_mission_en">Our Mission (en)</label>
                            <br>
                            <div>{{ $page->our_mission_en != null ? $page->our_mission_en : '-' }}</div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="our_mission_ar">Our Mission (ar)</label>
                            <br>
                            <div class="float-right">{{ $page->our_mission_ar != null ? $page->our_mission_ar : '-' }}
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row ">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="our_vision_en">Our Vision (en)</label>
                            <br>
                            <div> {{ $page->our_vision_en != null ? $page->our_vision_en : '-' }}</div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="our_vision_ar">Our Vision (en)</label>
                            <br>
                            <div class="float-right">{{ $page->our_vision_ar != null ? $page->our_vision_ar : '-' }}
                            </div>
                        </div>
                    </div>
                </div>
                @endif
                <div class="row ">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="meta_description">Meta Description (en)</label>
                            <br>
                            <div>{{ $page->meta_description != null ? $page->meta_description : '-' }}</div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="meta_description_ar">Meta Description (ar)</label>
                            <br>
                            <div class="float-right">{{ $page->meta_description_ar != null ? $page->meta_description_ar
                                : '-' }}</div>
                        </div>
                    </div>
                </div>

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