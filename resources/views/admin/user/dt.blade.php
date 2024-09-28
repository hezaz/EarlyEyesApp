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
        <div class="col-md-12">
            <div class="card card-solid">
                <div class="card-body pb-0">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 d-flex align-items-stretch flex-column">
                          <div class="card bg-light d-flex flex-fill">
                            <div class="card-header text-muted border-bottom-0">
                             <b>Name: {{ucwords($user->full_name)}}</b>
                            </div>
                            <div class="card-body pt-0">
                              <div class="row">
                                <div class="col-7">
                                    <p class="text-muted text-sm"><b>Gender: </b> {{$user->userDetails->gender}} </p>
                                 <span class="text-muted text-sm">Role:  @if($user->role_id == '1')
                                        Student
                                    @elseif($user->role_id == '2')
                                        Parent
                                    @else
                                        Tutor
                                    @endif</span>
                                  @if($user->role_id == '1')
                                    @if(!empty($user->parent))<p class="text-muted text-sm"><b>Parent's Name: </b> {{$user->parent->full_name}} </p>@endif
                                    @if(!empty($user->parent))<p class="text-muted text-sm"><b>Parent's Contact No.: </b> {{$user->parent->mobile_number}} </p>@endif
                                    <p class="text-muted text-sm"><b>School: </b> {{$user->userDetails->school_name}} </p>
                                    <p class="text-muted text-sm"><b>Class: </b> {{$user->userDetails->class}} </p>
                                    <p class="text-muted text-sm"><b>Course: </b> {{$user->userDetails->course}} </p>
                                  @elseif($user->role_id == '2')
                                    @if(isset($children) && count($children) > 0)
                                        @foreach($children as $child)
                                            <p class="text-muted text-sm"><b>Parent's Of: </b> {{ucwords($child->full_name)}},  </p>
                                        @endforeach
                                    @endif
                                  @else
                                    <p class="text-muted text-sm"><b>Experience: </b> {{$user->userDetails->experience}} </p>
                                  @endif
                                  <ul class="ml-4 mb-0 fa-ul text-muted">
                                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-envelope"></i></span> Email: {{$user->email}}</li>
                                    @if($user->role_id != '1')
                                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> Phone #: {{$user->mobile_number}}</li>
                                    @endif
                                  </ul>
                                </div>
                                @if(!empty($user->userDetails))
                                    @if($user->userDetails->profile_pic != '')
                                        @php $url =  $_ENV['APP_URL'].'public/images/user/'.$user->userDetails->profile_pic; @endphp
                                    @else
                                        @php $url = $_ENV['APP_URL'].'public/admin/dist/img/default-150x150.png'; @endphp
                                    @endif
                                @else
                                    @php $url = $_ENV['APP_URL'].'public/admin/dist/img/default-150x150.png'; @endphp
                                @endif
                                <div class="col-5 text-center">
                                  <img src="{{$url}}" alt="user-avatar" class="img-circle img-fluid" style="width: 150px; height: 150px;">
                                </div>
                              </div>
                            </div>
                            <div class="card-footer">
                              <div class="text-right">
                                 @if($user->is_active == 1)
                                      <a href="{{url('admin/users/block/'.$user->id.'/'.Request::segment(5))}}" class="btn btn-sm btn-danger">
                                          <i class="fas fa-user-lock"></i> Block
                                        </a>
                                @else 
                                    <a href="{{url('admin/users/unblock/'.$user->id.'/'.Request::segment(5))}}" class="btn btn-sm btn-success">
                                          <i class="fas fa-unlock-alt"></i> Unblock
                                        </a>
                                @endif
                                @if($user->is_active == 1)
                                    <a href="{{url('admin/users/'.Request::segment(5))}}" class="btn btn-sm btn-primary">
                                 @else 
                                 <a href="{{url('admin/block-users/'.Request::segment(5))}}" class="btn btn-sm btn-primary">
                                 @endif
                                  <i class="fas fa-arrow-left"></i> Back
                                </a>
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection