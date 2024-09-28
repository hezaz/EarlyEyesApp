@extends('admin.layouts.main')
@section('main-container')
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Edit Quiz</h1>
      </div>
      <div class="col-sm-6">
      </div>
    </div>
  </div>
</section>
<section class="content form-placeholder">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="card card-primary">
          @if ($errors->any())
            <div class="alert alert-danger">
                There were some problems with your input.<br><br>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
          @endif
          <form id="quiz-form" action="{{ route('update.question', $quiz->id) }}" method="post" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">                    
                        <div class="form-group">
                          <label for="course_id">Course <span style="color: red;">*</span></label>
                          <select name="course_id" class="form-control" id="course_id">
                            <option value="">Choose...</option>
                            @if(!empty($courses))
                                @foreach($courses as $course) 
                                    <option value="{{ $course->id }}" {{ $course->id == $quiz->course_id ? 'selected' : '' }}>{{ $course->course_title }}</option>
                                @endforeach
                            @endif
                          </select>
                        </div> 
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="quiz">Quiz <span style="color: red;">*</span></label>
                        <input type="text" name="quiz" class="form-control" id="quiz" placeholder="Enter question" value="{{ old('quiz', $quiz->quiz) }}" >
                      </div> 
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="answer">Answer <span style="color: red;">*</span></label>
                        <select name="answer" class="form-control" id="answer">
                            <option value="">Choose...</option>
                            <option value="option_1" {{ $quiz->answer == 'option_1' ? 'selected' : '' }}>Option 1</option>
                            <option value="option_2" {{ $quiz->answer == 'option_2' ? 'selected' : '' }}>Option 2</option>
                            <option value="option_3" {{ $quiz->answer == 'option_3' ? 'selected' : '' }}>Option 3</option>
                            <option value="option_4" {{ $quiz->answer == 'option_4' ? 'selected' : '' }}>Option 4</option>
                        </select>
                      </div> 
                    </div>                      
                </div>  
                <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="option1">Option 1 <span style="color: red;">*</span></label>
                        <input type="text" name="option1" class="form-control" id="option1" placeholder="Option 1" value="{{ old('option1', $quiz->option1) }}" >
                      </div> 
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="option2">Option 2 <span style="color: red;">*</span></label>
                        <input type="text" name="option2" class="form-control" id="option2" placeholder="Option 2" value="{{ old('option2', $quiz->option2) }}" >
                      </div>  
                    </div>                      
                </div>
                <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="option3">Option 3 <span style="color: red;">*</span></label>
                        <input type="text" name="option3" class="form-control" id="option3" placeholder="Option 3" value="{{ old('option3', $quiz->option3) }}" >
                      </div> 
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="option4">Option 4 <span style="color: red;">*</span></label>
                        <input type="text" name="option4" class="form-control" id="option4" placeholder="Option 4" value="{{ old('option4', $quiz->option4) }}" >
                      </div>  
                    </div>                      
                </div>
                <div class="button-group">
                    <button type="submit" class="btn btn-primary">Update Quiz</button>
                    <a href="{{ url('admin/quiz') }}">
                        <button type="button" class="btn btn-default">Cancel</button>
                    </a>
                </div>
            </div>
          </form>
        </div>
     </div>
  </div>
</section>
@endsection
