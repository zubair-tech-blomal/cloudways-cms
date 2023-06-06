@extends('backend.layouts.master')

@section('title')
@include('backend.pages.blogs.partials.title')
@endsection

@section('admin-content')
@include('backend.pages.blogs.partials.header-breadcrumbs')
<div class="container-fluid">
    @include('backend.layouts.partials.messages')
    <h4 class="page-title">
        Create New Faq
    </h4>
    <div class="create-page">

        <form action="{{ route('admin.faqs.store') }}" method="POST" enctype="multipart/form-data" data-parsley-validate data-parsley-focus="first">
            @csrf
            <div class="form-body">


                <div class="card-body">
                    <div class="container-fluid" style="border:1px solid #cecece;">
                        <br />
                        <div class="alert alert-dark" role="alert">
                            In English
                        </div>
                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <br />
                                    <label class="control-label" for="question_en">Question (en) <span class="required">*</span></label>
                                    <textarea type="text" class="form-control" id="question_en" name="question_en" value="{{ old('question_en') }}" placeholder="Faq Question" required=""></textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <br />
                                    <label class="control-label" for="answer_en">Answer (en) <span class="required">*</span></label>
                                    <textarea type="text" class="form-control" id="answer_en" name="answer_en" value="{{ old('answer_en') }}" placeholder="Faq Answer" required=""></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="container-fluid" style="border:1px solid #cecece;">
                        <br />

                        <br />
                        <div class="alert alert-dark d-block text-center" role="alert">
                            بالعربية
                        </div>

                        <div class="row">

                            <div class="col-md-6">

                                <div class="form-group">
                                    <br />
                                    <label class="control-label" for="question_ar">Question (ar) <span class="required">*</span></label>
                                    <textarea type="text" dir="rtl" class="form-control" id="question_ar" name="question_ar" value="{{ old('question_ar') }}" placeholder="بالعربية" required=""></textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <br />
                                    <label class="control-label" for="answer_ar">Answer (ar) <span class="required">*</span></label>
                                    <textarea type="text" dir="rtl" class="form-control" id="answer_ar" name="answer_ar" value="{{ old('answer_ar') }}" placeholder="بالعربية" required=""></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row ">
                        <div class="col-md-6">
                            <div class="form-group has-success">
                                <label class="control-label" for="status">Status <span class="required">*</span></label>
                                <select class="form-control custom-select" id="status" name="status" required>
                                    <option value="1" {{ old('status')===1 ? 'selected' : null }}>Active</option>
                                    <option value="0" {{ old('status')===0 ? 'selected' : null }}>Inactive</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-actions">
                                <div class="card-body">
                                    <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i>
                                        Save</button>
                                    <a href="{{ route('admin.faqs.index') }}" class="btn btn-dark">Cancel</a>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </form>
    </div>
</div>
@endsection

@section('scripts')
<script>

</script>
@endsection
