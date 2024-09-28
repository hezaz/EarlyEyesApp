@extends('admin.layouts.main')
@section('main-container')
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Add Course</h1>
      </div>
      <div class="col-sm-6">
      </div>
    </div>
  </div>
</section>
<section class="content form-placeholder">
	<div class="container-fluid">
    <div class="row">
    	<div class="col-md-8">
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
          <form id="course-form" action="{{route('save.course')}}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="course_title">Course Title <span style="color: red;">*</span></label>
                        <input type="text" name="course_title" class="form-control" id="course_title" placeholder="Course Title" value="{{ old('course_title') }}" >
                      </div> 
                    </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="course_category">Course Category <span style="color: red;">*</span></label>
                          <select name="course_category" class="form-control" id="course_category">
                            <option value="">Choose...</option>
                            <option value="HTML">HTML</option>
                            <option value="PHP">PHP</option>
                            <option value="C++">C++</option>
                            <option value="PYTHON">PYTHON</option>
                            <option value="JAVA">JAVA</option>
                            <option value="ASP.NET">ASP.NET</option>
                            <option value="REACT JS ">REACT JS</option>
                          </select>
                        </div> 
                      </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="course_duration">Course Duration <span style="color: red;">*</span></label>
                        <input type="text" name="course_duration" class="form-control" id="course_duration" placeholder="Ex - Hours, Day, Weeks, Month" value="{{ old('course_duration') }}" >
                      </div> 
                    </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="course_duration">Course Level <span style="color: red;">*</span></label>
                          <select name="course_level" class="form-control" id="course_level">
                            <option value="">Choose...</option>
                            <option value="Beginner">Beginner</option>
                            <option value="Intermediate">Intermediate</option>
                            <option value="Advanced">Advanced</option>                            
                          </select>
                        </div> 
                      </div>                      
                  </div>  
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="price">Price<span style="color: red;">*</span></label>                       
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">$</span>
                          </div>
                          <input type="number" name="price" class="form-control" id="price" placeholder="Price" min="1" value="{{ old('price') }}" >
                          
                        </div>
                      </div> 
                    </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="enrollment_limit">Enrollment Limit <span style="color: red;">*</span></label>
                          <input type="number" name="enrollment_limit" class="form-control" id="enrollment_limit" placeholder="Enrollment Limit" min="1" value="{{ old('enrollment_limit') }}" >
                        </div> 
                      </div>                    
                  </div>  
                  <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                          <label for="course_date">Course Date<span style="color: red;">*</span></label>
                           <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text">
                                <i class="far fa-calendar-alt"></i>
                              </span>
                            </div>
                            <input type="text" name="course_date" class="form-control float-right" id="course_date">
                          </div>
                        </div> 
                      </div> 

                    <div class="col-md-6">
                        <div class="form-group">
                          <label for="instructor_assigment">Instructor Assignment <span style="color: red;">*</span></label>
                          <select name="instructor_assignment" class="form-control" id="instructor_assigment">
                            <option value="">Choose Tutor</option>
                            @if(count($users) > 0)
                                @foreach($users as $user)
                                    <option value="{{$user->id}}">{{ucwords($user->full_name)}}</option>
                                @endforeach
                            @endif
                          </select>
                        </div> 
                      </div> 
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Course Thumbnail<span style="color: red;">*</span></label>
                        <div class="input-group">
                          <div class="custom-file">
                            <input type="file" class="custom-file-input" id="course_thumbnails" name="course_thumbnails">
                            <label class="custom-file-label" for="course_thumbnails">Choose file</label>
                          </div>
                          
                        </div>
                      </div> 
                    </div>
                      <div class="col-md-6">
                        <div class="form-group">
                        <label>Course Materials</label>
                        <div class="input-group">
                          <div class="custom-file">
                            <input type="file" class="custom-file-input" id="course_materials" name="course_materials">
                            <label class="custom-file-label" for="course_materials">Choose file</label>
                          </div>
                          
                        </div>
                      </div> 
                    </div>
                  </div>
                    <div class="row">
                         <div class="col-md-12">
                          <div class="form-group">
                            <label for="course_description">Course Description<span style="color: red;">*</span></label>
                            <textarea class="form-control" name="course_description" rows="3" placeholder="Enter ..." id="course_description"></textarea>
                          </div> 
                        </div>
                      <!-- <div class="col-md-6">
                        <div class="form-group">
                           <div class="custom-control custom-switch">
                              <label class="custom-control-label" for="status">Active</label>
                              <input type="checkbox" class="custom-control-input" id="status" value="1" name="status" checked>
                            </div>
                        </div> 
                      </div> -->
                    </div>
                     
                  </div>    
                  
                  <div class="button-group">
                      <button type="submit" class="btn btn-primary">Save Course</button>
                      <a href="{{url('admin/courses')}}">
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
