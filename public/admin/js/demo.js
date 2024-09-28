$(document).ready(function() {
    $('#course-form').validate({
        rules: {
            course_teacher_name: {
                required: true
            },
            course_id: {
                required: true
            },
            course_subject: {
                required: true
            },
            course_code: {
                required: true
            },
            course_name: {
                required: true
            },
            session_number: {
                required: true
            },
            session_time: {
                required: true
            },
            topic: {
                required: true
            }, 
            course_module: {
                required: true
            }, 
            semester: {
                required: true
            },
            grade: {
                required: true
            },
        },
        submitHandler: function(form) {
            $(form).submit();
        }
    });
});


$(document).ready(function() {
    $('#quiz-form').validate({
        rules: {
            course_id: {
                required: true
            },
            quiz: {
                required: true
            },
            answer: {
                required: true
            },
            option1: {
                required: true
            },
            option2: {
                required: true
            },
            option3: {
                required: true
            },
            option4: {
                required: true
            },
        },
        submitHandler: function(form) {
            $(form).submit();
        }
    });
});


$(document).on('change', '#course_id', function(){
    var course_id = $(this).val();
    if(course_id != '') {
        $.ajax({
            type:'get',
            url:mainUrl+'admin/get-course-by-id/'+course_id,
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            success:function(response) {
                var data = JSON.parse(response);
                $('#course_subject').val(data.subject);
                $('#course_name').val(data.name);
                $('#course_code').val(data.code);
                $('#session_number').val(data.session_number);
            }
        });
    }
});

$(document).ready(function() {
    $('#multi-question-form').validate({
      rules: {
        course_id: {
          required: true
        },
        exam_time: {
          required: true
        },
        topic: {
          required: true
        },
        session_question: {
          required: true
        },
        answer1: {
          required: true
        },
        answer2: {
          required: true
        },
        answer3: {
          required: true
        },
        answer4: {
          required: true
        },
        score: {
          required: true
        }
      },
      
      submitHandler: function(form) {
        $(form).submit();
      }
    });
    
    $('#bool-question-form').validate({
      rules: {
        course_id: {
          required: true
        },
        exam_time: {
          required: true
        },
        topic: {
          required: true
        },
        session_question: {
          required: true
        },
        answer1: {
          required: true
        },
        answer2: {
          required: true
        },
        score: {
          required: true
        }
      },
      submitHandler: function(form) {
        $(form).submit();
      }
    });
});

$(document).ready(function() {
    $('#multi-exam-form').validate({
        rules: {
            course_subject: {
                required: true
            },
            grade: {
                required: true
            },
            exam_time: {
                required: true
            },
            session_question: {
                required: true
            },
            answer1: {
                required: true
            },
            answer2: {
                required: true
            },
            answer3: {
                required: true
            },
            answer4: {
                required: true
            },
            answer5: {
                required: true
            },
            score: {
                required: true
            }
        },
        messages: {
            // Add custom error messages here if needed
        },
        errorElement: 'div',
        errorPlacement: function(error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function(element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function(element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function(form) {
            $(form).submit();
          }
    });
    
    
    $('#bool-exam-form').validate({
        rules: {
            course_subject: {
                required: true
            },
            grade: {
                required: true
            },
            exam_time: {
                required: true
            },
            session_question: {
                required: true
            },
            answer1: {
                required: true
            },
            answer2: {
                required: true
            },
            score: {
                required: true
            }
        },
        messages: {
            // Add custom error messages here if needed
        },
        errorElement: 'div',
        errorPlacement: function(error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function(element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function(element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function(form) {
            $(form).submit();
          }
    });
    
    $('#conf-exam-form').validate({
        rules: {
            course_subject: {
                required: true
            },
            grade: {
                required: true
            },
            exam_time: {
                required: true
            },
            session_question: {
                required: true
            },
            answer1: {
                required: true
            },
            score: {
                required: true
            }
        },
        messages: {
            // Add custom error messages here if needed
        },
        errorElement: 'div',
        errorPlacement: function(error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function(element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function(element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function(form) {
            $(form).submit();
          }
    });
});

function showSpinner() {
    document.getElementById('spinner').style.display = 'block';
  }

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

  $('#course_date').datepicker({
        dateFormat: 'yy-mm-dd'
    });

    // Set the current date as the default value
    $('#course_date').datepicker('setDate', new Date());

