@extends('backend.layouts.master')

@section('title')
    @include('backend.pages.blogs.partials.title')
@endsection

@section('admin-content')
    @include('backend.pages.blogs.partials.header-breadcrumbs')
    <div class="container-fluid">
        @include('backend.pages.blogs.partials.top-show')
        @include('backend.layouts.partials.messages')
        <div class="table-responsive product-table">
            <table class="table table-striped table-bordered display ajax_view" id="blogs_table">
                <thead>
                    <tr>
                        <th>Sl</th>
                        <th>Question</th>
                        {{-- <th>Featured Image</th> --}}
                        <th>Status</th>
                        <th>Display # (Website)</th>
                        <th width="100">Action</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
    const ajaxURL = "<?php echo Route::is('admin.faqs.trashed' ? 'faqs/trashed/view' : 'faqs') ?>";

    $('table#blogs_table').DataTable({
        dom: 'Blfrtip',
        language: {processing: "<span class='spinner-border spinner-border-sm' role='status' aria-hidden='true'></span> Loading Data..."},
        processing: true,
        serverSide: true,
        ajax: {url: ajaxURL},
        aLengthMenu: [[25, 50, 100, 1000, -1], [25, 50, 100, 1000, "All"]],
        buttons: ['excel', 'pdf', 'print'],
        columns: [
            {data: 'DT_RowIndex', name: 'DT_RowIndex'},
            {data: 'question_en', name: 'question_en'},
            // {data: 'image', name: 'image'},
            {data: 'status', name: 'status'},
            {data: 'sort', name: 'sort'},
            {data: 'action', name: 'action'}
        ]
    });
    </script>
@endsection