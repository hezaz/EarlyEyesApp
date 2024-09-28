@php use App\Models\Category; @endphp
@extends('admin.layouts.main')
@section('main-container')
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>User Detail</h1>
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
     @if(!empty($user->userDetails))
        @if($user->userDetails->profile_pic != '')
            @php $url =  $_ENV['APP_URL'].'public/images/user/'.$user->userDetails->profile_pic; @endphp
        @else
            @php $url = $_ENV['APP_URL'].'public/admin/dist/img/default-150x150.png'; @endphp
        @endif
    @else
        @php $url = $_ENV['APP_URL'].'public/admin/dist/img/default-150x150.png'; @endphp
    @endif
            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle" src="{{$url}}" alt="User profile picture" style="height:100px;">
                </div>

                <h3 class="profile-username text-center">{{ucwords($user->full_name)}}</h3>

                <p class="text-muted text-center">@if($user->role_id == '1')
                                        Student
                                    @elseif($user->role_id == '2')
                                        Parent
                                    @else
                                        Tutor
                                    @endif</p>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    @if($user->role_id == '3')
                        <b>Courses</b> <a class="float-right" href="#">{{$courseCount}}</a>
                    @else
                        <b>Courses</b> <a class="float-right" href="#">{{$courseCount}}</a>
                    @endif
                  </li>
                  <li class="list-group-item">
                   @if($user->role_id == '3')
                        <b>Students</b> <a class="float-right" href="#">{{$studCount}}</a>
                    @else
                        <b>Tutors</b> <a class="float-right" href="#">{{$courseCount}}</a>
                    @endif
                  </li>
                  @if($user->role_id != '3')
                  <li class="list-group-item">
                   @if($user->role_id == '1')
                        <b>Parent Name</b> <a class="float-right" href="#">{{!empty($parent) ? ucwords($parent->full_name) : ''}}</a>
                     
                    @else
                        <b>Children</b> 
                        @if(!empty($children))
                            @foreach($children as $child)
                                <a class="float-right" href="#">{{ucwords($child->full_name)}}</a>
                            @endforeach
                        @endif
                    @endif
                  </li>
                  @endif
                </ul>

                @if($user->is_active == 1)
                      <a href="{{url('admin/users/block/'.$user->id.'/'.Request::segment(5))}}" class="btn btn-sm btn-danger">
                          <i class="fas fa-user-lock"></i> Block
                        </a>
                @else 
                    <a href="{{url('admin/users/unblock/'.$user->id.'/'.Request::segment(5))}}" class="btn btn-sm btn-success">
                          <i class="fas fa-unlock-alt"></i> Unblock
                        </a>
                @endif
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- About Me Box -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">About {{ucwords($user->full_name)}}</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <strong><i class="fas fa-book mr-1"></i> Experience</strong>

                <p class="text-muted">
                 {{$user->userDetails ? $user->userDetails->experience : ''}}
                </p>

                <hr>

                <strong><i class="fas fa-calendar-alt mr-1"></i> DOB</strong>

                <p class="text-muted"> {{$user->userDetails ? $user->userDetails->dob : ''}}</p> 
                @if($user->role_id != 2)
                <hr>

                <strong><i class="fas fa-venus-mars mr-1"></i> Gender</strong>

                <p class="text-muted"> {{$user->userDetails ? $user->userDetails->gender : ''}}</p>
                @endif
                 <hr>

                <strong><i class="fas fa-envelope mr-1"></i> Email</strong>

                <p class="text-muted"> {{$user->email}}</p>
 @if($user->role_id != 2)
                <hr>

                <strong><i class="fas fa-graduation-cap mr-1"></i> Courses</strong>

                <p class="text-muted">
                    @if(!empty($courses))
                        @foreach($courses as $course)
                            <span class="tag tag-danger">{{$course->course_title}}</span>,
                        @endforeach
                    @endif
                </p>

@endif                <hr>

                <strong><i class="fas fa-comment mr-1"></i> Comments</strong>

                <p class="text-muted">{{$user->userDetails ? $user->userDetails->comment : ''}}</p>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
    </div>
</section>

@endsection