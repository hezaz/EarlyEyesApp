@extends('admin.layouts.main')
@section('main-container')
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-8">
        <h1>Quiz</h1>
      </div>
      <div class="col-sm-8">
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
              <input type="text" name="search" class="form-control srch" placeholder="Search Question" value="{{ request('search') }}">
              @include('admin.layouts.search')
            </div>
          </form>
        </div>
        <a href="{{ route('addQuestion') }}">
          <button class="btn btn-primary add-course" data-toggle="tooltip" data-placement="top" title="Add Quiz">
            <i class="fas fa-plus"></i>
          </button>
        </a>
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
              <th>Course</th>
              <th>Quiz</th>
              <th>Answer</th>
              <th>Option 1</th>
              <th>Option 2</th>
              <th>Option 3</th>
              <th>Option 4</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            @foreach ($quizzes as $quiz)
              <tr>
                <td data-toggle="tooltip" data-placement="top" title="{{ $quiz->course->description }}">{{ $quiz->course->course_title }}</td>
                <td>{{ $quiz->quiz }}</td>
                <td><button class="btn btn-warning student">
                    @if($quiz->answer == 'option_1')
                        {{ $quiz->option1 }}
                    @elseif($quiz->answer == 'option_2')
                        {{ $quiz->option2 }}
                    @elseif($quiz->answer == 'option_3')
                        {{ $quiz->option3 }}
                    @else
                         {{ $quiz->option4 }}
                     @endif</button></td>
                <td>{{ $quiz->option1 }}</td>
                <td>{{ $quiz->option2 }}</td>
                <td>{{ $quiz->option3 }}</td>
                <td>{{ $quiz->option4 }}</td>
                <td>
                  <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      ...
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                      <a class="dropdown-item text-info" href="{{url('admin/quiz/edit/'.$quiz->id)}}">Edit</a>
                      <form action="{{ route('delete.question') }}" method="POST" onsubmit="return confirmDelete()">
                      @csrf
                      <input type="hidden" name="id" value="{{ $quiz['id'] }}" />
                      <button type="submit" class="btn dlt" title="Delete Quiz">
                        Delete
                      </button>
                    </form>
                    </div>
                  </div>
                </td>
              </tr>
              <tr><td colspan="8"></td></tr>
            @endforeach
          </tbody>
        </table>
        {{ $quizzes->links() }} <!-- Pagination links -->
      </div>
    </div>
  </div>
</div>

<script>
function confirmDelete() {
  return confirm('Are you sure you want to delete this quiz?');
}
</script>
@endsection
