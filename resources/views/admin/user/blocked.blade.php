@php use App\Models\Category; @endphp
@extends('admin.layouts.main')
@section('main-container')
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Blocked Users</h1>
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
<div class="row">
<div class="col-md-12">
<div class="card">
  <div class="card-header">
    <div class="card-tools">
      <form action="{{ route('getUsers') }}" method="GET">
        <div class="input-group input-group-sm srch-div">
            <input type="text" name="search" class="form-control srch" placeholder="Search User" value="{{ request('search') }}">
            @include('admin.layouts.search')
        </div>
      </form>
    </div>
  </div>
  <!-- /.card-header -->
  <div class="card-body table-responsive p-0">    
    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif
    <table class="table table-striped table-valign-middle">
      <thead>
        <tr>
          <th>Name</th>
          <th>Email</th>
          <th>Mobile Number</th>
          <th>Gender</th>
          <th>User Type</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody> 
        @php $i = 1; @endphp
        @if(!empty($users))
          @foreach($users as $user)
            <tr>
              <td>
                @if(!empty($user->userDetails))
                  @if($user->userDetails->profile_pic != '')
                    @php $url =  $_ENV['APP_URL'].'public/images/user/'.$user->userDetails->profile_pic; @endphp
                  @else
                    @php $url = $_ENV['APP_URL'].'public/admin/dist/img/default-150x150.png'; @endphp
                  @endif
                @else
                  @php $url = $_ENV['APP_URL'].'public/admin/dist/img/default-150x150.png'; @endphp
                @endif
                <img src="{{$url}}" alt="" class="img-circle img-size-32 mr-2" style="width: 32px; height: 32px;">
                {{ ucwords($user->full_name) }}
              </td>
              <td>{{ $user->email }}</td>
              <td>{{ $user->mobile_number }}</td>
              <td>
                @if($user->userDetails->gender == 'Male')
                  <button class="btn btn-info male">{{ ucwords($user->userDetails->gender) }}</button>
                @else
                  <button class="btn btn-info female">{{ ucwords($user->userDetails->gender) }}</button>
                @endif
              </td>
              <td>
                @if($user->role_id == '1')
                  <button class="btn btn-warning student">Student</button> 
                @elseif($user->role_id == '2')
                  <button class="btn btn-success parent">Parent</button>
                @else
                  <button class="btn btn-info tutor">Tutor</button>
                @endif
              </td>
              <td>
                <div class="dropdown">
                  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton{{ $user->id }}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ...
                  </button>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton{{ $user->id }}">
                    <a class="dropdown-item text-info" href="{{ url('admin/users/info/'.$user->id.'/all') }}">Info</a>
                    <a class="dropdown-item text-warning" href="{{ url('admin/users/unblock/'.$user->id.'/all') }}">Unblock</a>
                    <form action="{{ route('delete.user') }}" method="POST" onsubmit="return confirmDelete()">
                      @csrf
                      <input type="hidden" name="id" value="{{ $user['id'] }}" />
                      <button type="submit" class="btn dlt" title="Delete User">
                        Delete
                      </button>
                    </form>
                  </div>
                </div>
              </td>
            </tr>
            <tr><td colspan="6"></td></tr>
          @endforeach
        @endif
      </tbody>
    </table>
  </div>
  {{ $users->links() }}
</div>
</div>
</div>

<script>
function confirmDelete() {
  return confirm('Are you sure you want to delete this user?');
}
</script>
@endsection
