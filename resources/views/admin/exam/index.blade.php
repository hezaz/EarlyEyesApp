@extends('admin.layouts.main')
@section('main-container')
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Sample Exam</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item active">Questions</li>
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
      <form action="{{ route('viewSampleExam') }}" method="GET">
        <div class="input-group input-group-sm" style="width: 150px;">
            <input type="text" name="search" class="form-control float-right" placeholder="Search" value="{{ request('search') }}">
    
            <div class="input-group-append">
                <button type="submit" class="btn btn-default">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </form>
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
        <th>Subject</th>
        <th>Question</th>
        <th>Answer</th>
        <th>Correct Answer</th>
        <th>Exam Time</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>
        @if(!empty($sampleexam))
          @foreach($sampleexam as $ques)
            <tr>
              <td>{{$ques['course_subject']}}</td>
              <td>{{$ques['session_question']}}</td>
              <td>
                  @if($ques['q_type'] == 'configure')
                    {!!$ques['answer1']!!}
                  @elseif($ques['q_type'] == 'boolean' || $ques['q_type'] == 'multiple')
                    <ul>
                        <li>{{$ques['answer1']}}</li>
                        <li>{{$ques['answer2']}}</li>
                        @if($ques['q_type'] == 'multiple')
                            <li>{{$ques['answer3']}}</li>
                            <li>{{$ques['answer4']}}</li>
                            <li>{{$ques['answer5']}}</li>
                        @endif
                    </ul>
                   @endif
              </td>
              <td>{{$ques['correct_answer']}}</td>
               <td>{{$ques['exam_time']}}</td>
			  <td>
			     <div class="btn-group" role="group" aria-label="Exam Actions">
                    <a href="{{url('admin/edit-exam/'.$ques['id'].'/'.$ques['q_type'])}}" class="btn btn-success" title="Edit Exam"><i class="fas fa-edit"></i></a>
                    <form action="{{ route('delete.exam') }}" method="POST">
                        @csrf
                        <input type="hidden" name="id" value="{{$ques['id']}}" />
                        <button type="submit" class="btn btn-danger" title="Delete Exam">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                    </form>
                  </div>
			  </td>
            </tr>
         @endforeach
     @endif
      </tbody>
  </table>
</div>
{{ $sampleexam->links() }}

@endsection