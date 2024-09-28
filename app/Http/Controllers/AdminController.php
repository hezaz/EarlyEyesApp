<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\Quiz;
use App\Models\Banner;
use App\Models\User;
use App\Models\UserDetail;
use App\Models\Event;
use App\Models\Exam;
use App\Models\Contact;
use App\Models\Question;
use Illuminate\Http\Request;
use Intervention\Image\ImageManagerStatic as Image;
use Symfony\Component\Process\Process;
use Symfony\Component\Process\Exception\ProcessFailedException;
use FFMpeg;
use FFMpeg\Format\Video\X264;


class AdminController extends Controller
{
    /*
    ** get Dashboard
    */
    public function getDashboard() {
        $data['title'] = 'Education | Admin | Dashboard';
       
        return view('admin.dashboard', $data);
    }
    
    /*
    **  users
    */
    public function getUsers(Request $request) {
        $data['title'] = 'Education | Admin | Users';
        $search = $request->input('search');
        // if($search != '') {
        //   $data['users'] = User::query()
        //         // ->where('user_type', 'student')
        //         ->where('status', 1)
        //         ->where('name', 'LIKE', "%$search%")
        //         ->orWhere('email', 'LIKE', "%$search%")
        //         ->orWhere('phone_no', 'LIKE', "%$search%")
        //         ->orWhere('gender', 'LIKE', "%$search%")
        //         ->orWhere('grade', 'LIKE', "%$search%")
        //         ->paginate(10);
        // } else {
             $data['users'] = User::where('is_active', 1)->with('userDetails')->latest()->paginate(10);
        // }
        return view('admin.user.index', $data);
    } 

    /*
    **  tutors
    */
    public function getTutor(Request $request) {
        $data['title'] = 'Education | Admin | Users';
        // $search = $request->input('search');
        // if($search != '') {
        //    $data['users'] = User::query()
        //         ->where('user_type', 'student')
        //         ->where('status', 1)
        //         ->where('name', 'LIKE', "%$search%")
        //         ->orWhere('email', 'LIKE', "%$search%")
        //         ->orWhere('phone_no', 'LIKE', "%$search%")
        //         ->orWhere('gender', 'LIKE', "%$search%")
        //         ->orWhere('grade', 'LIKE', "%$search%")
        //         ->paginate(10);
        // } else {
            $data['users'] = User::where(['is_active'=> 1, 'role_id' => 3])->with('userDetails')->latest()->paginate(10);
        // }
        return view('admin.user.tutor', $data);
    }

    /*
    **  student
    */
    public function getStudent(Request $request) {
        $data['title'] = 'Education | Admin | Users';
        // $search = $request->input('search');
        // if($search != '') {
        //    $data['users'] = User::query()
        //         ->where('user_type', 'student')
        //         ->where('status', 1)
        //         ->where('name', 'LIKE', "%$search%")
        //         ->orWhere('email', 'LIKE', "%$search%")
        //         ->orWhere('phone_no', 'LIKE', "%$search%")
        //         ->orWhere('gender', 'LIKE', "%$search%")
        //         ->orWhere('grade', 'LIKE', "%$search%")
        //         ->paginate(10);
        // } else {
        $data['users'] = User::where(['is_active'=> 1, 'role_id' => 1])->with(['userDetails', 'parent'])->latest()->paginate(10);
        // }
        return view('admin.user.student', $data);
    }

    /*
    **  paremt
    */
    public function getParent(Request $request) {
        $data['title'] = 'Education | Admin | Users';
        // $search = $request->input('search');
        // if($search != '') {
        //    $data['users'] = User::query()
        //         ->where('user_type', 'student')
        //         ->where('status', 1)
        //         ->where('name', 'LIKE', "%$search%")
        //         ->orWhere('email', 'LIKE', "%$search%")
        //         ->orWhere('phone_no', 'LIKE', "%$search%")
        //         ->orWhere('gender', 'LIKE', "%$search%")
        //         ->orWhere('grade', 'LIKE', "%$search%")
        //         ->paginate(10);
        // } else {
        $data['users'] = User::where(['is_active'=> 1, 'role_id' => 2])->with(['userDetails', 'children'])->latest()->paginate(10);
        
        
        
        
        // }
        return view('admin.user.parent', $data);
    }
    
    
    /*
    **  users
    */
    public function getBlockUsers(Request $request) {
        $data['title'] = 'Education | Admin | Users';
        /*$search = $request->input('search');
         if($search != '') {
           $data['users'] = User::query()
                ->where('user_type', 'student')
                ->where('status', 0)
                ->where('name', 'LIKE', "%$search%")
                ->orWhere('email', 'LIKE', "%$search%")
                ->orWhere('phone_no', 'LIKE', "%$search%")
                ->orWhere('gender', 'LIKE', "%$search%")
                ->orWhere('grade', 'LIKE', "%$search%")
                ->paginate(10);
        } else {
        }*/
        $data['users'] = User::where(['is_active'=> 0])->with('userDetails')->latest()->paginate(10);

        return view('admin.user.blocked', $data);
    }

    /*
    **  tutors
    */
    public function getBlockTutor(Request $request) {
        $data['title'] = 'Education | Admin | Users';
        // $search = $request->input('search');
        // if($search != '') {
        //    $data['users'] = User::query()
        //         ->where('user_type', 'student')
        //         ->where('status', 1)
        //         ->where('name', 'LIKE', "%$search%")
        //         ->orWhere('email', 'LIKE', "%$search%")
        //         ->orWhere('phone_no', 'LIKE', "%$search%")
        //         ->orWhere('gender', 'LIKE', "%$search%")
        //         ->orWhere('grade', 'LIKE', "%$search%")
        //         ->paginate(10);
        // } else {
             $data['users'] = User::where(['is_active'=> 0, 'role_id' => 3])->with('userDetails')->latest()->paginate(10);
        // }
        return view('admin.user.b_tutor', $data);
    }

    /*
    **  student
    */
    public function getBlockStudent(Request $request) {
        $data['title'] = 'Education | Admin | Users';
        // $search = $request->input('search');
        // if($search != '') {
        //    $data['users'] = User::query()
        //         ->where('user_type', 'student')
        //         ->where('status', 1)
        //         ->where('name', 'LIKE', "%$search%")
        //         ->orWhere('email', 'LIKE', "%$search%")
        //         ->orWhere('phone_no', 'LIKE', "%$search%")
        //         ->orWhere('gender', 'LIKE', "%$search%")
        //         ->orWhere('grade', 'LIKE', "%$search%")
        //         ->paginate(10);
        // } else {
        $data['users'] = User::where(['is_active'=> 0, 'role_id' => 1])->with(['userDetails', 'parent'])->latest()->paginate(10);
        // }
        return view('admin.user.b_student', $data);
    }

    /*
    **  paremt
    */
    public function getBlockParent(Request $request) {
        $data['title'] = 'Education | Admin | Users';
        // $search = $request->input('search');
        // if($search != '') {
        //    $data['users'] = User::query()
        //         ->where('user_type', 'student')
        //         ->where('status', 1)
        //         ->where('name', 'LIKE', "%$search%")
        //         ->orWhere('email', 'LIKE', "%$search%")
        //         ->orWhere('phone_no', 'LIKE', "%$search%")
        //         ->orWhere('gender', 'LIKE', "%$search%")
        //         ->orWhere('grade', 'LIKE', "%$search%")
        //         ->paginate(10);
        // } else {
             $data['users'] = User::where(['is_active'=> 0, 'role_id' => 2])->with(['userDetails', 'children'])->latest()->paginate(10);
        // }
        return view('admin.user.b_parent', $data);
    }
    
    
    /*
    **  block User
    */
    public function blockUser($id, $type) {
        User::where('id', $id)->update(array('is_active' => 0));
        if($type == 'student') {
            return redirect()->route('getBlockStudent')->with('success','User blocked successfully');
        } else if($type == 'tutor') {
            return redirect()->route('getBlockTutor')->with('success','User blocked successfully');
        } else if($type == 'parent') {
            return redirect()->route('getBlockParent')->with('success','User blocked successfully');
        } else {
            return redirect()->route('getBlockUsers')->with('success','User blocked successfully');
        }
    }
    
    /*
    **  unblock User
    */
    public function unblockUser($id, $type) {
        User::where('id', $id)->update(array('is_active' => 1));
        if($type == 'student') {
            return redirect()->route('getStudent')->with('success','User unblocked successfully');
        } else if($type == 'tutor') {
            return redirect()->route('getTutor')->with('success','User unblocked successfully');
        } else if($type == 'parent') {
            return redirect()->route('getParent')->with('success','User unblocked successfully');
        } else {
            return redirect()->route('getUsers')->with('success','User unblocked successfully');
        }
    }
    
   
    /*
    **  profile
    */
    public function userInfo($id, $type) {
        $data['title'] = 'Education | Admin | User Info';
        $data['user'] = User::with(['userDetails'])->where('id', $id)->first();
        $data['children'] = User::with(['userDetails'])->where('parent_id', $id)->get();
        $parent_id = $data['user']->parent_id;
        $data['parent'] = User::with(['userDetails'])->where('id', $parent_id)->first();
        $data['courseCount'] = Course::with(['instructor'])->where('instructor_assignment', $id)->count();
        
        $data['studCount'] = UserDetail::whereIn('course_id', function($query) use ($id) {
                            $query->select('id')
                                  ->from(with(new Course)->getTable())
                                  ->where('instructor_assignment', $id);
                        })->count();
        $data['courses'] = Course::with(['instructor'])->where('instructor_assignment', $id)->get();


        return view('admin.user.detail', $data);
    }
    
    /*
    ** add course
    */
    public function addCourse() {
        $data['title'] = 'Education | Admin | Add Course';
        $data['users'] = User::where(['role_id'=> 3, 'is_active' => 1])->orderBy('full_name', 'ASC')->get();
        return view('admin.course.new', $data);
    }
    
    /*
    ** edit course
    */
    public function editCourse($id=null) {
        $data['title'] = 'Education | Admin | Edit Course';
        $data['course'] = Course::where('id', $id)->first();
        $data['users'] = User::where(['role_id'=> 3, 'is_active' => 1])->orderBy('full_name', 'ASC')->get();

        return view('admin.course.edit', $data);
    }
    
    /*
    ** view question
    */
    public function getCourse(Request $request) {
        $data['title'] = 'Education | Admin | Course';
        
        // Fetch courses with their assigned instructors where the course status is active
        $data['courses'] = Course::where('status', 1)
            ->with('instructor') // Eager load the instructor relationship
            ->latest()
            ->paginate(10);
    
        return view('admin.course.index', $data);
    }

    
    /*
    ** save course
    */
    public function saveCourse(Request $request) {
        $input = $request->all();
        $validatedData = $request->validate([
            'course_title' => 'required',
            'course_category' => 'required',
            'course_duration' => 'required',
            'course_level' => 'required',
            'price' => 'required',
            'enrollment_limit' => 'required',
            'course_description' => 'required',
            'instructor_assignment' => 'required',
            'course_thumbnails' => 'required|image',
            'course_materials' => 'nullable|file',
            'course_date' => 'required',
        ]); 
        $course = new Course();
        $course->course_title = $input['course_title'];
        $course->course_category = $input['course_category'];
        $course->course_duration = $input['course_duration'];
        $course->course_level = $input['course_level'];
        $course->price = $input['price'];
        $course->enrollment_limit = $input['enrollment_limit'];
        $course->course_description = $input['course_description'];
        $course->instructor_assignment = $input['instructor_assignment']; // Assuming multiple instructors are selected
    
        if ($request->hasFile('course_thumbnails')) {
            $image = $request->file('course_thumbnails');
            $imageName = 'course_' . time() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('images/course/thumbs'), $imageName);
            $course->course_thumbnails = env('APP_URL') . '/public/images/course/thumbs/' . $imageName;
        }
    
        if ($request->hasFile('course_materials')) {
            $materials = $request->file('course_materials');
            $materialsName = 'materials_' . time() . '.' . $materials->getClientOriginalExtension();
            $materials->move(public_path('materials/course/materials'), $materialsName);
            $course->course_materials = env('APP_URL') . '/public/course/materials/' . $materialsName;
        }
    
        $course->course_date = date('Y-m-d', strtotime($input['course_date']));
        $course->save();
        return redirect()->route('viewCourse')->with('success', 'Course added successfully');
    }
    
    /*
	** delete Course
	*/
	public function deleteCourse(Request $request) {
		$id = $request->post('id');
        Course::where('id', $id)->delete();
		Contact::where('course_id', $id)->delete();
		Quiz::where('course_id', $id)->delete();

        UserDetail::where('course_id', $id)->update(['course_id' => '', 'course_name' => '', 'course_schedule' => '']);
		return redirect()->route('viewCourse')->with('success','Course deleted successfully');

    }
    
     /*
    ** update course
    */
   public function updateCourse(Request $request, $id) {
        $input = $request->all();
        
        // Validate the request data
        $validatedData = $request->validate([
            'course_title' => 'required',
            'course_category' => 'required',
            'course_duration' => 'required',
            'course_level' => 'required',
            'price' => 'required',
            'enrollment_limit' => 'required',
            'course_description' => 'required',
            'instructor_assignment' => 'required',
            'course_thumbnails' => 'nullable|image',
            'course_materials' => 'nullable|file',
            'course_date' => 'required',
        ]);
        
        // Find the existing course
        $course = Course::findOrFail($id);
        
        // Update the course with new data
        $course->course_title = $input['course_title'];
        $course->course_category = $input['course_category'];
        $course->course_duration = $input['course_duration'];
        $course->course_level = $input['course_level'];
        $course->price = $input['price'];
        $course->enrollment_limit = $input['enrollment_limit'];
        $course->course_description = $input['course_description'];
        $course->instructor_assignment = $input['instructor_assignment'];
        
        // Handle course thumbnails upload
        if ($request->hasFile('course_thumbnails')) {
            $image = $request->file('course_thumbnails');
            $imageName = 'course_' . time() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('images/course/thumbs'), $imageName);
            $course->course_thumbnails = env('APP_URL') . '/public/images/course/thumbs/' . $imageName;
        }
        
        // Handle course materials upload
        if ($request->hasFile('course_materials')) {
            $materials = $request->file('course_materials');
            $materialsName = 'materials_' . time() . '.' . $materials->getClientOriginalExtension();
            $materials->move(public_path('materials/course/materials'), $materialsName);
            $course->course_materials = env('APP_URL') . '/public/course/materials/' . $materialsName;
        }
        
        // Update course date
        $course->course_date = date('Y-m-d', strtotime($input['course_date']));
        
        // Save the updated course
        $course->save();
        
        return redirect()->route('viewCourse')->with('success', 'Course updated successfully');
    }


    /*
    **  course detail
    */
    public function courseInfo($id) {
        $data['title'] = 'Education | Admin | Course Info';
        $data['course'] = Course::with(['instructor'])->where('id', $id)->first();


        return view('admin.course.detail', $data);
    }
    
    /*
    ** generate Token
    */
    function generateToken($id){
        $encrypt_method = "AES-256-CBC";
        $secret_key = 'qpzWUm1fRNGklS5aIPs09LxK1fRNGklS';
        $secret_iv = 'pMXboBlu3ar79vFdRIzZt5gH';
        $key = hash('sha256', $secret_key); 
        $iv = substr(hash('sha256', $secret_iv), 0, 16);
        return base64_encode(openssl_encrypt($id,$encrypt_method, $key, 0, $iv));
    }
   
    /*
    ** add question
    */
    public function addQuestion() {
        $data['title'] = 'Education | Admin | Add Question';
        $data['courses'] = Course::where('status', 1)->orderBy('course_title', 'ASC')->get();
       
        return view('admin.question.new', $data);
    } 
    
    /*
    ** view question
    */
    public function viewQuestion(Request $request) {
        $data['title'] = 'Education | Admin | Question'; 
      
        $data['quizzes'] = Quiz::with('course')->latest()->paginate(10);
        
        return view('admin.question.index', $data);
    } 
    
    /*
    ** add sample exam
    */
    public function addSampleExam($type=null) {
        $data['title'] = 'Education | Admin | Add Sample Exam';
        if($type == 'multiple') {
            return view('admin.exam.multiple', $data);
        } else if($type == 'boolean') {
            return view('admin.exam.boolean', $data);
        } else {
            return view('admin.exam.new', $data);
        }
    } 
    
    /*
    ** view question
    */
    public function viewSampleExam(Request $request) {
        $data['title'] = 'Education | Admin | Sample Exam';
        $data['sampleexam'] = Exam::latest()->paginate(10);
        
         $searchQuery = $request->input('search');

        $query = Exam::query();
    
        if (!empty($searchQuery)) {
            $query->where('course_subject', 'like', '%' . $searchQuery . '%')
                  ->orWhere('session_question', 'like', '%' . $searchQuery . '%');
        }
    
        $data['sampleexam'] = $query->latest()->paginate(10);
        return view('admin.exam.index', $data);
    }
    
    /*
    ** get course by id
    */
    public function getCourseById($id) {
        $course = Course::find($id);
        $data['name'] = $course->course_name;
        $data['code'] = $course->course_code;
        $data['subject'] = $course->course_subject;
        $data['session_number'] = $course->session_number;
        echo json_encode($data);
    }
    
    public function saveQuestion(Request $request)
    {
         $request->validate([
            'course_id' => 'required|exists:courses,id',
            'quiz' => 'required|string',
            'answer' => 'required|string',
            'option1' => 'required|string',
            'option2' => 'required|string',
            'option3' => 'required|string',
            'option4' => 'required|string',
        ]);

        Quiz::create([
            'course_id' => $request->course_id,
            'quiz' => $request->quiz,
            'answer' => $request->answer,
            'option1' => $request->option1,
            'option2' => $request->option2,
            'option3' => $request->option3,
            'option4' => $request->option4,
        ]);

        return redirect()->route('question')->with('success', 'Quiz added successfully.');
    }
    
    /*
	** delete question
	*/
	public function deleteQuestion(Request $request) {
		$id = $request->post('id');
		
        Quiz::where('id', $id)->delete();
        
		return redirect()->route('question')->with('success','Quiz deleted successfully');

    }
    
    /*
    **  edit question
    */
    public function editQuestion($id) {
        $data['title'] = 'Education | Admin | Add Question';
        $data['courses'] = Course::where('status', 1)->orderBy('course_title', 'ASC')->get();
        $data['quiz'] = Quiz::find($id);
        return view('admin.question.edit', $data);
    } 
    
    /*
    **  update question
    */
    public function updateQuestion(Request $request, $id)
    {
       $request->validate([
            'course_id' => 'required|exists:courses,id',
            'quiz' => 'required|string',
            'answer' => 'required|string',
            'option1' => 'required|string',
            'option2' => 'required|string',
            'option3' => 'required|string',
            'option4' => 'required|string',
        ]);

        Quiz::where('id', $id)->update([
            'course_id' => $request->course_id,
            'quiz' => $request->quiz,
            'answer' => $request->answer,
            'option1' => $request->option1,
            'option2' => $request->option2,
            'option3' => $request->option3,
            'option4' => $request->option4,
        ]);

        return redirect()->route('question')->with('success', 'Quiz updated successfully.');
    }
    
   
    
    /*
    ** logout
    */
    public function adminLogout(Request $request)
    {
        auth()->guard('admin')->logout();
        Session::flush();
        Session::put('success', 'You are logout sucessfully');
        return redirect(route('adminLogin'));
    }
    
    
    /*
    ** add event
    */
    public function addEvent() {
        $data['title'] = 'Education | Admin | Add Event';
        return view('admin.event.new', $data);
    }
    
    /*
    **  edit event
    */
    public function editEvent($id) {
        $data['title'] = 'Education | Admin | Edit Event';
        $data['event'] = Event::find($id);
        return view('admin.event.edit', $data);
    } 
    
    /*
    ** save event
    */
    public function saveEvent(Request $request) {
         $validatedData = $request->validate([
            'event_name' => 'required',
            'event_url' => 'nullable',
            'image' => 'nullable|image'
        ]); 
        
        $event = new Event;
        $event->event_name = $request->event_name;
        $event->event_url = $request->event_url;
        
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = 'event_' . time() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('images/events'), $imageName);
            $event->image = env('APP_URL') . '/public/images/events/' . $imageName;
        }
        
        $event->save();
        
        return redirect()->route('viewEvent')->with('success','Event added successfully');
    } 
    
    /*
    ** update event
    */
    public function updateEvent(Request $request, $id) {
         $validatedData = $request->validate([
            'event_name' => 'required',
            'event_url' => 'nullable',
            'image' => 'nullable|image'
        ]); 
        
        $update = array(
            "event_name" => $request->event_name,
            "event_url" => $request->event_url);
        
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = 'event_' . time() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('images/events'), $imageName);
            $update['image'] = env('APP_URL') . '/public/images/events/' . $imageName;
        }
        
        Event::where('id', $id)->update($update);
        
        return redirect()->route('viewEvent')->with('success','Event updated successfully');
    } 

	/*
	** delete event
	*/
	public function deleteEvent(Request $request) {
		$id = $request->post('id');
		
        Event::where('id', $id)->delete();
        
		return redirect()->route('viewEvent')->with('Event','Quiz deleted successfully');

    }

    /*
    ** view event
    */
    public function viewEvent() {
        $data['title'] = 'Education | Admin | Event';
        $data['events'] = Event::latest()->paginate(10);
        return view('admin.event.index', $data);
    } 
    
    /*
    ** view Contact
    */
    public function viewContact() {
        $data['title'] = 'Education | Admin | Contact';
        $data['contacts'] = Contact::with(['user', 'course'])->latest()->paginate(10);
        return view('admin.contact.index', $data);
    } 
	/*
    ** view banners
    */
    public function banner() {
        $data['title'] = 'Education | Admin | Contact';
        $data['banners'] = Banner::with(['user'])->latest()->paginate(10);
        return view('admin.banner.index', $data);
    } 
    
    function deleteUser(Request $request) {
        $user = User::with('userDetails')->where('id', $request->id)->first();
		Banner::where('user_id', $request->id)->delete();
        Contact::where('user_id', $request->id)->delete();
        if (!empty($user->userDetails)) {
            if ($user->userDetails->profile_pic != '') {
                unlink(public_path('images/user/' . $user->userDetails->profile_pic));
            }
    
            UserDetail::where('user_id', $request->id)->delete();
        }
    
        $children = User::with('userDetails')->where('parent_id', $request->id)->get();
    
        if ($children->isNotEmpty()) {
            foreach ($children as $child) {
                if (!empty($child->userDetails) && $child->userDetails->profile_pic != '') {
                    unlink(public_path('images/user/' . $child->userDetails->profile_pic));
                }
    
                UserDetail::where('user_id', $child->id)->delete();
            }
        }
    
        User::where('parent_id', $request->id)->delete();
        User::where('id', $request->id)->delete();
       
    
        return redirect()->back()->with('success', 'User deleted successfully');
    }
}





