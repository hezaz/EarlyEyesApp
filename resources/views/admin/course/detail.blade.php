@php use App\Models\Category; @endphp
@extends('admin.layouts.main')
@section('main-container')
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Course Detail</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item active">User</li>
        </ol>
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>
<section class="content">
    <div class="row">
       <div class="col-md-8">
     
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
               

                <h3 class="profile-username text-center">{{ucwords($course->course_title)}}</h3>

               

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                        <b>Subject</b> <a class="float-right" href="#">{{$course->course_category}}</a>
                  </li>
                  <li class="list-group-item">
                        <b>Course Date</b> <a class="float-right" href="#">{{$course->course_date}}</a>
                  </li>
                  <li class="list-group-item">
                        <b>Course Duration</b> <a class="float-right" href="#">{{$course->course_duration}}</a>
                  </li>
                  <li class="list-group-item">
                        <b>Course Level</b> <a class="float-right" href="#">{{$course->course_level}}</a>
                  </li>
                  
                 
                </ul>

                
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- About Me Box -->
            <div class="card card-primary">
             
              <!-- /.card-header -->
              <div class="card-body">
                <strong><i class="fas fa-user mr-1"></i> Instructor</strong>

                <p class="text-muted">
                 Instructor {{(!empty($course->instructor)) ? ucwords($course->instructor->full_name) : ''}}
                </p>

              

              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
    </div>
</section>

@endsection