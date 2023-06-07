@extends('backend.layouts.master')

@section('title')
    @include('backend.pages.blogs.partials.title')
@endsection

@section('admin-content')
    @include('backend.pages.blogs.partials.header-breadcrumbs')
    <div class="container-fluid">
        @include('backend.layouts.partials.messages')
        <h4 class="page-title">
            Show Faq
        </h4>
        <div class="create-page">
                <div class="form-body">
                    <div class="card-body">
                        {{-- <div class="alert alert-dark" role="alert">
                            In English
                        </div> --}}

                        @if($blog->status==1)
                        <div class="alert alert-success" role="alert">Active</div> 
                        @else
                        <div class="alert alert-warning" role="alert">Inactive</div> 
                        @endif

                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="question_en">Question (en)</label>
                                    <br>
                                    {{ $blog->question_en }}
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="slug">Question (ar)</label>
                                    <br>
                                    {{ $blog->question_ar }}
                                </div>
                            </div>
                        </div>

                        {{-- <div class="row">
                            <div class="col-md-6">
                                <div class="form-group has-success">
                                    <label class="control-label" for="status">Status</label>
                                    <br>
                                    {{ $blog->status === 1 ? 'Active' : 'Inactive' }}
                                </div>
                            </div>
                        </div> --}}
                    
                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="answer_en">Answer (en)</label>
                                    <div>
                                        {!! $blog->answer_en !!}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="answer_ar">Answer (ar)</label>
                                    <div>
                                        {!! $blog->answer_ar !!}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-actions">
                                    <div class="card-body">
                                        <a  class="btn btn-success" href="{{ route('admin.faqs.edit', $blog->id) }}"> <i class="fa fa-edit"></i> Edit Now</a>
                                        <a href="{{ route('admin.faqs.index') }}" class="btn btn-dark ml-2">Cancel</a>
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