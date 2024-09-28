<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Helpers\Helper;
use App\Models\Course;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class CourseController extends Controller
{
    public function index()
    {  
    	$course = Course::where('status', 1)
            ->with('instructor')
            ->latest()
            ->get();

        return response()->json([
            'success' => true,
            'message' => 'course list',
            'data' => $course
        ], 200);
	}
}