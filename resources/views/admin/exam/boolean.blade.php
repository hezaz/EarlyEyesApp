@extends('admin.layouts.main')
@section('main-container')
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Add Sample Exam (True | False)</h1>
      </div>
      <div class="col-sm-6">
        
      </div>
    </div>
  </div>
</section>
<section class="content">
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
          <form id="bool-exam-form" action="{{route('saveExam')}}" method="post" enctype="multipart/form-data">
            @csrf
            <input type="hidden" name="q_type" value="boolean" />
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="course_subject">Course Subject <span style="color: red;">*</span></label>
                        <select name="course_subject" class="form-control" id="course_subject">
                          <option value="">Choose Subject</option>
                          <option value="Mathematics">Mathematics</option>
                          <option value="Physics">Physics</option>
                          <option value="Chemistry">Chemistry</option>
                          <option value="Biology">Biology</option>
                          <option value="English">English</option>
                          <option value="History">History</option>
                          <option value="Geography">Geography</option>
                          <option value="Civic">Civic</option>
                        </select>

                      </div> 
                     <div class="form-group">
                        <label for="grade">Grade <span style="color: red;">*</span></label>
                        <select name="grade" class="form-control" id="grade">
                          <option value="{{ old('grade') }}">Select Grade</option>
                          <option value="Grade-1">Grade 1</option>
                          <option value="Grade-2">Grade 2</option>
                          <option value="Grade-3">Grade 3</option>
                          <option value="Grade-4">Grade 4</option>
                          <option value="Grade-5">Grade 5</option>
                          <option value="Grade-6">Grade 6</option>
                          <option value="Grade-7">Grade 7</option>
                          <option value="Grade-8">Grade 8</option>
                          <option value="Grade-9">Grade 9</option>
                          <option value="Grade-10">Grade 10</option>
                          <option value="Grade-11">Grade 11</option>
                          <option value="Grade-12">Grade 12</option>
                          <option value="UG-Year1">Undergraduate Year 1</option>
                          <option value="UG-Year2">Undergraduate Year 2</option>
                          <option value="UG-Year3">Undergraduate Year 3</option>
                          <option value="UG-Year4">Undergraduate Year 4</option>
                          <option value="UG-Year5">Undergraduate Year 5</option>
                          <option value="UG-Year6">Undergraduate Year 6</option>
                          <option value="UG-Year7">Undergraduate Year 7</option>
                          <option value="G-Year1">Graduate Year 1</option>
                          <option value="G-Year2">Graduate Year 2</option>
                          <option value="G-Year3">Graduate Year 3</option>
                          <option value="PG-Year1">Postgraduate Year 1</option>
                          <option value="PG-Year2">Postgraduate Year 2</option>
                          <option value="PG-Year3">Postgraduate Year 3</option>
                          <option value="Fellowship">Fellowship</option>
                        </select>
                      </div> 
                      <div class="form-group">
                        <label for="exam_time">Exam Time <span style="color: red;">*</span></label>
                        <select name="exam_time" class="form-control" id="exam_time">
                          <option value="">Choose..</option>
                           <option value="1 Minute">1 Minute</option>
                            <option value="2 Minutes">2 Minutes</option>
                            <option value="3 Minutes">3 Minutes</option>
                            <option value="4 Minutes">4 Minutes</option>
                            <option value="5 Minutes">5 Minutes</option>
                            <option value="10 Minutes">10 Minutes</option>
                            <option value="15 Minutes">15 Minutes</option>
                            <option value="30 Minutes">30 Minutes</option>
                            <option value="1 Hour">1 Hour</option>
                            <option value="1.5 Hours">1.5 Hours</option>
                            <option value="2 Hours">2 Hours</option>
                            <option value="2.5 Hours">2.5 Hours</option>
                            <option value="3 Hours">3 Hours</option>
                        </select>
                      </div> 
                      <div class="form-group">
                        <label for="session_question">Exam Question <span style="color: red;">*</span></label>
                        <textarea name="session_question" class="form-control" id="session_question" rows="3" placeholder="Enter Session Question">{{ old('session_question') }}</textarea>
                      </div>
                       <div class="form-group">
                        <label for="session_question_answer">Exam Question & Answer<span style="color: red;">*</span></label>
                        <input type="text" name="answer1" class="form-control" value="True" readonly /><br/>
                        <input type="text" name="answer2" class="form-control" value="False" readonly /><br/>
                     </div>
                      <div class="form-group">
                        <label for="correct_answer">Correct Answer<span style="color: red;">*</span></label>
                        <select name="correct_answer" class="form-control" id="correct_answer">
                          <option value="">Choose..</option>
                          <option value="True">True</option>
                          <option value="False">False</option>
                        </select>
                     </div> 
                  </div>
                <div class="col-md-6">
                      <div class="form-group">
                        <label for="score">Score (10/10)</label>
                        <select name="score" class="form-control" id="score">
                            <option value="">Select Score</option>
                            @for($i = 1; $i <= 10; $i++)
                                <option value="{{ $i }}"
                                    @if(old('score') == $i)
                                        selected
                                    @endif
                                >{{ $i }}</option>
                            @endfor
                        </select>
                      </div> 
                      <div class="form-group">
                        <label for="detailed_exp">Detailed Explanation</label>
                        <input type="text" name="detailed_exp" class="form-control" id="detailed_exp" placeholder="See Detailed Explanation" value="{{ old('detailed_exp') }}" >
                      </div> 
                      <div class="form-group">
                        <label for="explanation_video">Explanation Video</label>
                        <input type="file" name="explanation_video" class="form-control" id="explanation_video" accept="video/*" />
                      </div> 
                      <div class="form-group">
                        <label for="references">References</label>
                        <input type="text" name="references1" class="form-control" id="references" placeholder="Link 1" value="{{ old('references1') }}" >
                      </div>  
                      <div class="form-group">
                        <input type="text" name="references2" class="form-control" placeholder="Link 2" value="{{ old('references2') }}" >
                      </div>  
                      <div class="form-group">
                        <input type="text" name="references3" class="form-control" placeholder="Link 3" value="{{ old('references3') }}" >
                      </div> 
                      <div class="button-group">
                            <button type="submit" class="btn btn-primary">Add Sample Exam</button>
                            <a href="{{url('admin/question')}}">
                                <button type="button" class="btn btn-default">Cancel</button>
                            </a>
                      </div>
                  </div>
                </div>
              <!-- End of Additional fields -->
            </div>
          </form>
        </div>
  	 </div>
	</div>
</section>
@endsection
