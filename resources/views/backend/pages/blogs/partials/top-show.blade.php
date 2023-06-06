
<!-- ============================================================== -->
<!-- Top Show Data of List Blog -->
<!-- ============================================================== -->
<div class="row mt-1">
    <!-- Column -->
    <div class="col-md-6 col-lg-3 col-xlg-3 pointer"  onclick="location.href='{{ route('admin.faqs.index') }}'">
        <div class="card card-hover">
            <div class="box bg-info text-center">
                <h1 class="font-light text-white">{{ $count_blogs }}</h1>
                <h6 class="text-white">Total Questions</h6>
            </div>
        </div>
    </div>

    <!-- Column -->
    <div class="col-md-6 col-lg-3 col-xlg-3 pointer"  onclick="location.href='{{ route('admin.faqs.index') }}'">
        <div class="card card-hover">
            <div class="box bg-success text-center">
                <h1 class="font-light text-white">{{ $count_active_blogs }}</h1>
                <h6 class="text-white">Active Questions</h6>
            </div>
        </div>
    </div>

    <!-- Column -->
    <div class="col-md-6 col-lg-3 col-xlg-3 pointer" onclick="location.href='{{ route('admin.faqs.trashed') }}'">
        <div class="card card-hover">
            <div class="box bg-primary text-center">
                <h1 class="font-light text-white">{{ $count_blogs - $count_active_blogs }} / {{ $count_trashed_blogs }} </h1>
                <h6 class="text-white">Inactive/Trashed Questions</h6>
            </div>
        </div>
    </div>

    @if (Auth::user()->can('blog.create'))
    <div class="col-md-6 col-lg-3 col-xlg-3 pointer" onclick="location.href='{{ route('admin.faqs.create') }}'">
        <div class="card card-hover">
            <div class="box bg-info text-center">
                <h1 class="font-light text-white">
                    <i class="fa fa-plus-circle"></i>
                </h1>
                <h6 class="text-white">Create New Question</h6>
            </div>
        </div>
    </div>
    @endif

</div>
