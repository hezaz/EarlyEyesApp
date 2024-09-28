<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Helpers\Helper;
use App\Models\UserDetail;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;
use DB;
use Auth;
use Illuminate\Support\Facades\Crypt;

class TeacherController extends Controller
{
    public function updateTeacher(Request $request)
    {  
        $token = $request->header('Authorization');
        $user = Helper::checkToken($token);
       
        if(isset($user->original['message'])) {
            return response()->json(['success' => false, 'message' => 'Unauthorized', 'data' => []], 401);
        }
        
        $validator = Validator::make($request->all(), [
            'full_name' => 'required',
            'email' => 'required',
            'mobile_number' => 'required',
            'gender' => 'required',
            'dob' => 'nullable',
            'school_name' => 'required',
            'tutor_email' => 'nullable',
            'mailing_address' => 'nullable',
            'experience' => 'required',
            'course_id' => 'required',
            'course_name' => 'required',
            'course_schedule' => 'required',
            'comment' => 'nullable|string',
            'profile_pic' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'full_name, email, password,mobile_number, gender, school_name, experience, course_id,
            course_name,course_schedule are required'], 401);
        }
        
        $validator = Validator::make($request->all(), [
            'email' => 'email'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Invalid email format.'], 401);

        } 
        
        $validator = Validator::make($request->all(), [
            'course_id' => 'integer'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Course id should be integer.'], 401);

        }
        
        $validator = Validator::make($request->all(), [
            'dob' => 'date'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'DOB format should be Y-m-d.'], 401);

        }
        
        $validator = Validator::make($request->all(), [
            'tutor_email' => 'email'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Invalid student email format.'], 401);

        }
        
         $validator = Validator::make($request->all(), [
            'profile_pic' => 'image'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'The profile picture must be an image file.'], 401);

        }
        
        $existingUser = User::where('email', $request->email)->where('id', '!=', $user->id)->first();
        if ($existingUser) {
            return response()->json(['success' => false, 'message' => 'Email already in use.'], 401);
        } 
        
        $existingUser = User::where('mobile_number', $request->mobile_number)->where('id', '!=', $user->id)->first();
        if ($existingUser) {
            return response()->json(['success' => false, 'message' => 'Mobile number already in use.'], 401);
        }
        
        $user->update([
            'full_name' => $request->full_name,
            'email' => $request->email,
            'mobile_number' => $request->mobile_number,
        ]);

        $profilePicPath = $user->userDetails->profile_pic ?? null;
    
        if ($request->hasFile('profile_pic')) {
            // Delete the existing profile picture if it exists
            if ($profilePicPath && file_exists(public_path('images/user/' . $profilePicPath))) {
                unlink(public_path('images/user/' . $profilePicPath));
            }
    
            // Save the new profile picture
            $secretname = Helper::generateToken($user->id);
            $imageName = $secretname . strtotime(date('Y-m-d H:i:s')) . '.jpg';
            $request->file('profile_pic')->move(public_path('images/user'), $imageName);
    
            $profilePicPath = $imageName;
        }

        // Update UserDetail
        $userDetail = UserDetail::updateOrCreate(
            ['user_id' => $user->id],
            [
                'gender' => $request->gender,
                'dob' => $request->dob ? date('Y-m-d', strtotime($request->dob)) : null,
                'school_name' => $request->school_name,
                'tutor_email' => $request->tutor_email ?? null,
                'mailing_address' => $request->mailing_address ?? null,
                'experience' => $request->experience ?? null,
                'comment' => $request->comment ?? null,
                'course_id' => $request->course_id ?? null,
                'course_name' => $request->course_name ?? null,
                'course_schedule' => $request->course_schedule ?? null,
                'profile_pic' => $profilePicPath,
            ]
        );

        $user = User::with('userDetails')->find($user->id);
        return response()->json([
            'success' => true,
            'message' => 'Tutor updated successfully',
            'data' => $user,
        ], 201);
    }
}
