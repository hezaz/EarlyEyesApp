@php use App\Models\Category; @endphp
@extends('admin.layouts.main')
@section('main-container')
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Courses</h1>
      </div>
      <div class="col-sm-6">
       
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>
<div class="row">
<div class="col-md-12">
<div class="card">
  <div class="card-header">

    <div class="card-tools">
      <form action="{{ route('viewCourse') }}" method="GET">
        <div class="input-group input-group-sm srch-div">
            <input type="text" name="search" class="form-control srch" placeholder="Search Course" value="{{ request('search') }}">
    
            @include('admin.layouts.search')
        </div>
    </form>
  </div>
      <a href="{{route('addCourse')}}"><button class="btn btn-primary add-course" data-toggle="tooltip" data-placement="top" title="Add Course"><i class="fas fa-plus"></i></button></a>

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
        <th>Course Title</th>
        <th>Subject</th>
        <th>Course Date</th>
        <th>Duration</th>
        <th>Level</th>
        <th>Enrollment Limit</th>
        <th>Instructor Assignment</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>
         @if(!empty($courses))
          @foreach($courses as $course)
            <tr>
              <td>{{$course['course_title']}}</td>
              <td>{{$course['course_category']}}</td>
              <td>{{$course['course_date']}}</td>
              <td>{{$course['course_duration']}}</td>
              <td>
                  @if($course['course_level'] == 'Beginner')
                    <button class="btn btn-warning student">Beginner</button>
                  @elseif($course['course_level'] == 'Intermediate')
                    <button class="btn btn-info tutor">Intermediate</button>
                  @else
                    <button class="btn btn-success parent">Advanced</button>
                  @endif
              </td>
              <td>{{$course['enrollment_limit']}}</td>
              <td>{{$course->instructor->full_name}}</td>
              <td>
                   <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  ...
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                  <a class="dropdown-item text-warning" href="{{url('admin/course-info/'.$course['id'])}}">Detail</a>
                  <a class="dropdown-item text-info" href="{{url('admin/edit-course/'.$course['id'])}}">Edit</a>
                  <form action="{{ route('delete.course') }}" method="POST" onsubmit="return confirmDelete()">
                      @csrf
                      <input type="hidden" name="id" value="{{ $course['id'] }}" />
                      <button type="submit" class="btn dlt" title="Delete Course">
                        Delete
                      </button>
                    </form>
                </div>
              </div>
              </td>
            </tr>
            <tr><td colspan="7"></td></tr>
          @endforeach
         @endif
      </tbody>
  </table>
</div>
<script>
function confirmDelete() {
  return confirm('Are you sure you want to delete this course?');
}
</script>
@endsection