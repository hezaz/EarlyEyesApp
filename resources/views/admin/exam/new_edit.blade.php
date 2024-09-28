@extends('admin.layouts.main')
@section('main-container')
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Edit Sample Exam (Solve | Configure | Explain)</h1>
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
          <form id="bool-exam-form" action="{{route('updateExam')}}" method="post" enctype="multipart/form-data">
            @csrf
            <input type="hidden" name="id" value="{{$exam->id}}" />
            <input type="hidden" name="q_type" value="configure" />
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="course_subject">Course Subject <span style="color: red;">*</span></label>
                        <select name="course_subject" class="form-control" id="course_subject">
                          <option value="">Choose Subject</option>
                          <option value="Mathematics" {{ $exam->course_subject === 'Mathematics' ? 'selected' : '' }}>Mathematics</option>
                          <option value="Physics" {{ $exam->course_subject === 'Physics' ? 'selected' : '' }}>Physics</option>
                          <option value="Chemistry" {{ $exam->course_subject === 'Chemistry' ? 'selected' : '' }}>Chemistry</option>
                          <option value="Biology" {{ $exam->course_subject === 'Biology' ? 'selected' : '' }}>Biology</option>
                          <option value="English" {{ $exam->course_subject === 'English' ? 'selected' : '' }}>English</option>
                          <option value="History" {{ $exam->course_subject === 'History' ? 'selected' : '' }}>History</option>
                          <option value="Geography" {{ $exam->course_subject === 'Geography' ? 'selected' : '' }}>Geography</option>
                          <option value="Civic" {{ $exam->course_subject === 'Civic' ? 'selected' : '' }}>Civic</option>
                        </select>
                      </div> 
                     <div class="form-group">
                        <label for="grade">Grade <span style="color: red;">*</span></label>
                        <select name="grade" class="form-control" id="grade">
                          <option value="{{ $exam->grade }}">{{ str_replace("_", " ",$exam->grade) }}</option>
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
                          <option value="{{ $exam->exam_time }}">{{ str_replace("_", " ",$exam->exam_time) }}</option>
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
                        <textarea name="session_question" class="form-control" id="session_question" rows="3" placeholder="Enter Session Question">{{ $exam->session_question }}</textarea>
                      </div>
                       <div class="form-group">
                        <label for="session_question_answer">Exam Question & Answer<span style="color: red;">*</span></label>
                         <textarea name="answer1" class="form-control" id="answer1" cols="6" rows="6" placeholder="Enter Session Answer" data-sample-short>{{ $exam->answer1 }}</textarea>
                     </div>
                      <div class="form-group">
                        <label for="correct_answer">Correct Answer<span style="color: red;">*</span></label>
                        <input type="text" name="correct_answer" class="form-control" id="correct_answer" placeholder="Enter Correct Answer" value="{{$exam->correct_answer}}" />
                     </div> 
                  </div>
                <div class="col-md-6">
                      <div class="form-group">
                        <label for="score">Score (10/10)</label>
                        <select name="score" class="form-control" id="score">
                            <option value="">Select Score</option>
                            @for($i = 1; $i <= 10; $i++)
                                <option value="{{ $i }}"
                                    @if($exam->score == $i)
                                        selected
                                    @endif
                                >{{ $i }}</option>
                            @endfor
                        </select>
                      </div> 
                      <div class="form-group">
                        <label for="detailed_exp">Detailed Explanation</label>
                        <input type="text" name="detailed_exp" class="form-control" id="detailed_exp" placeholder="See Detailed Explanation" value="{{ $exam->detailed_exp }}" >
                      </div> 
                      <div class="form-group">
                        <label for="explanation_video">Explanation Video</label>
                        <input type="file" name="explanation_video" class="form-control" id="explanation_video" accept="video/*" />
                      </div> 
                      @if($exam->explanation_video != '')
                          <div class="form-group">
                              <video width="320" height="240" controls autoplay>
                                <source src="{{$exam->explanation_video}}" type="video/mp4"></source>

                                </video>
                          </div>
                      @endif
                      <div class="form-group">
                        <label for="references">References</label>
                        <input type="text" name="references1" class="form-control" id="references" placeholder="Link 1" value="{{ $exam->references1 }}" >
                      </div>  
                      <div class="form-group">
                        <input type="text" name="references2" class="form-control" placeholder="Link 2" value="{{ $exam->references2 }}" >
                      </div>  
                      <div class="form-group">
                        <input type="text" name="references3" class="form-control" placeholder="Link 3" value="{{ $exam->references3 }}" >
                      </div> 
                      <div class="button-group">
                            <button type="submit" class="btn btn-primary">Update Sample Exam</button>
                            <a href="{{url('admin/exam')}}">
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

<script>
    /*ClassicEditor
        .create(document.querySelector('#answer1'), {
            plugins: [ 'MathType', 'ChemType' ],
            toolbar: [ 'MathType', 'ChemType', '|', 'undo', 'redo' ]
        })
        .then(editor => {
            console.log('Editor was initialized', editor);
        })
        .catch(error => {
            console.error('There was an error initializing the editor', error);
        });*/
        
       /*  CKEDITOR.replace('answer1', {
      extraPlugins: 'mathjax',
      mathJaxLib: 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML',
      height: 320,
      removeButtons: 'PasteFromWord'
    });

    if (CKEDITOR.env.ie && CKEDITOR.env.version == 8) {
      document.getElementById('ie8-warning').className = 'tip alert';
    }*/
    
    (function() {
 var mathElements = ['math', 'maction', 'maligngroup', 'malignmark', 'menclose', 'merror', 'mfenced', 'mfrac', 'mglyph', 'mi', 'mlabeledtr', 'mlongdiv', 'mmultiscripts', 'mn', 'mo', 'mover', 'mpadded', 'mphantom', 'mroot', 'mrow', 'ms', 'mscarries', 'mscarry', 'msgroup', 'msline', 'mspace', 'msqrt', 'msrow', 'mstack', 'mstyle', 'msub', 'msup', 'msubsup', 'mtable', 'mtd', 'mtext', 'mtr', 'munder', 'munderover', 'semantics', 'annotation', 'annotation-xml'
 ];
CKEDITOR.plugins.addExternal('ckeditor_wiris', 'https://ckeditor.com/docs/ckeditor4/4.14.0/examples/assets/plugins/ckeditor_wiris/', 'plugin.js');
 CKEDITOR.replace('answer1', {
 extraPlugins: 'ckeditor_wiris,print,format,font,colorbutton,justify,uploadimage, find, magicline,bidi,easyimage,image2,colordialog,tableresize',
 mathJaxLib: 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML',
 format_tags: 'p;h1;h2;h3;h4;h5;h6;pre;address;div',
 // Setting default language direction to right-to-left.
 contentsLangDirection: 'ltr',
 removeButtons: 'ExportPdf,Form,Checkbox,Radio,TextField,Select,Textarea,Button,ImageButton,HiddenField,NewPage,CreateDiv,Flash,Iframe,About,ShowBlocks,Maximize',
toolbarGroups: [{name: 'clipboard', groups: ['clipboard', 'undo']}, {name: 'editing', groups: ['find', 'selection', 'spellchecker']}, {name: 'links'},
 {name: 'insert'}, {name: 'forms'}, {name: 'tools'}, {name: 'document', groups: ['mode', 'document', 'doctools']},
 {name: 'colors'}, {name: 'others'}, {name: 'about'},
 '/',
 {name: 'basicstyles', groups: ['basicstyles', 'cleanup']}, {name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi']},
 {name: 'styles'}
 ],
 // For now, MathType is incompatible with CKEditor file upload plugins.
 removePlugins: 'uploadimage,uploadwidget,uploadfile,filetools,filebrowser',
 removeDialogTabs: 'image:advanced;link:advanced',
 height: 320,
 // Update the ACF configuration with MathML syntax.
 extraAllowedContent: mathElements.join(' ') + '(*)[*]{*};img[data-mathml,data-custom-editor,role](Wirisformula);h3{clear};h2{line-height};h2 h3{margin-left,margin-top}; div{border,background,text-align}'
 });
 }());
    
    
    
</script>
@endsection
