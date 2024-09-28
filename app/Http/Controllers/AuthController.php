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

class AuthController extends Controller
{
    public function studentSignup(Request $request)
    {  
        $validator = Validator::make($request->all(), [
            'full_name' => 'required',
            'email' => 'required',
            'password' => 'required',
            'gender' => 'required',
            'dob' => 'nullable',
            'class' => 'required',
            'student_email' => 'nullable',
            'mailing_address' => 'nullable',
            'experience' => 'required',
            'comment' => 'nullable',
            'device_id' => 'required',
            'device_token' => 'required',
            'profile_pic' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'full_name, email, password, gender, class, experience, device_id, device_token are required'], 401);

        }
        
        $validator = Validator::make($request->all(), [
            'email' => 'email'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Invalid email format.'], 401);

        }
        
        $validator = Validator::make($request->all(), [
            'email' => 'unique:users'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Email address already used.'], 401);

        } 
        
        $validator = Validator::make($request->all(), [
            'password' => 'min:8'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Minimum length of password should altleast 8 characters long .'], 401);

        }
        
        $validator = Validator::make($request->all(), [
            'dob' => 'date'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'DOB format should be Y-m-d.'], 401);

        }
        
        $validator = Validator::make($request->all(), [
            'student_email' => 'email'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Invalid student email format.'], 401);

        }
        
         $validator = Validator::make($request->all(), [
            'profile_pic' => 'image|mimes:jpeg,png,jpg,gif,svg,avif, webp'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'The profile picture must be an image file of type jpeg, png, jpg, gif, 
            or svg.'], 401);

        }
        
      
        $user = User::create([
            'role_id' => 1,
            'full_name' => $request->full_name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'is_active' => true, 
            'device_id' => $request->device_id,
            'device_token' => $request->device_token,
        ]);

        $profilePicPath = null;
        if ($request->hasFile('profile_pic')) {
            $secretname = Helper::generateToken($user->id);
            $imageName = $secretname . strtotime(date('Y-m-d H:i:s')) . '.jpg';
            $request->file('profile_pic')->move(public_path('images/user'), $imageName);

            $profilePicPath = $imageName;
        }

        $userDetail = UserDetail::create([
            'user_id' => $user->id,
            'gender' => $request->gender,
            'dob' => date('Y-m-d', strtotime($request->dob)) ?? null,
            'class' => $request->class,
            'student_email' => $request->student_email ?? null,
            'mailing_address' => $request->mailing_address ?? null,
            'experience' => $request->experience ?? null,
            'comment' => $request->comment ?? null,
            'profile_pic' => $profilePicPath,
        ]);

        $token = JWTAuth::fromUser($user);
        User::where('id', $user->id)->update(['token' => $token]);
        $user = User::find($user->id);

        return response()->json([
            'success' => true,
            'message' => 'Student registered successfully',
            'data' => $user->load('userDetails'),
        ], 201);
    }

    public function teacherSignup(Request $request)
    {  
        $validator = Validator::make($request->all(), [
            'full_name' => 'required',
            'email' => 'required',
            'password' => 'required',
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
            'device_id' => 'required',
            'device_token' => 'required',
            'profile_pic' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'full_name, email, password,mobile_number, gender, school_name, experience, course_id,
            course_name,course_schedule,device_id, device_token are required'], 401);
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
            'email' => 'unique:users'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Email address already used.'], 401);

        } 
        $validator = Validator::make($request->all(), [
            'mobile_number' => 'unique:users'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Mobile number already exist.'], 401);

        } 
        
        $validator = Validator::make($request->all(), [
            'password' => 'min:8'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Minimum length of password should altleast 8 characters long .'], 401);

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
            'profile_pic' => 'image|mimes:jpeg,png,jpg,gif,svg,avif, webp'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'The profile picture must be an image file of type jpeg, png, jpg, gif, 
            or svg.'], 401);

        }
        
        
        $user = User::create([
            'role_id' => 3,
            'full_name' => $request->full_name,
            'email' => $request->email,
            'mobile_number' => $request->mobile_number,
            'password' => Hash::make($request->password),
            'is_active' => true, 
            'device_id' => $request->device_id,
            'device_token' => $request->device_token,
        ]);

        $profilePicPath = null;
        if ($request->hasFile('profile_pic')) {
            $secretname = Helper::generateToken($user->id);
            $imageName = $secretname . strtotime(date('Y-m-d H:i:s')) . '.jpg';
            $request->file('profile_pic')->move(public_path('images/user'), $imageName);

            $profilePicPath = $imageName;
        }

        $userDetail = UserDetail::create([
            'user_id' => $user->id,
            'gender' => $request->gender,
            'dob' => date('Y-m-d', strtotime($request->dob)) ?? null,
            'school_name' => $request->school_name,
            'tutor_email' => $request->tutor_email ?? null,
            'mailing_address' => $request->mailing_address ?? null,
            'experience' => $request->experience ?? null,
            'comment' => $request->comment ?? null,
            'course_id' => $request->course_id ?? null,
            'course_name' => $request->course_name ?? null,
            'course_schedule' => $request->course_schedule ?? null,
            'profile_pic' => $profilePicPath,
        ]);

        $token = JWTAuth::fromUser($user);
        User::where('id', $user->id)->update(['token' => $token]);
        $user = User::find($user->id);
         return response()->json([
            'success' => true,
            'message' => 'Teacher registered successfully',
            'data' => $user->load('userDetails'),
        ], 201);
    }

    public function parentSignup(Request $request)
    {  
        $validator = Validator::make($request->all(), [
            'full_name' => 'required',
            'email' => 'required',
            'password' => 'required',
            'mobile_number' => 'required',
            'relationship' => 'required',
            'dob' => 'nullable',            
            'device_id' => 'required',
            'device_token' => 'required',
            'profile_pic' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'full_name, email, password,mobile_number, relationship, device_id, device_token are required'], 401);
        }

        $validator = Validator::make($request->all(), [
            'email' => 'email'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Invalid email format.'], 401);

        } 
        
        $validator = Validator::make($request->all(), [
            'email' => 'unique:users'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Email address already used.'], 401);

        } 
        
        $validator = Validator::make($request->all(), [
            'mobile_number' => 'unique:users'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Mobile number already exist.'], 401);

        } 
        
        $validator = Validator::make($request->all(), [
            'password' => 'min:8'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Minimum length of password should altleast 8 characters long .'], 401);

        }
        
        $validator = Validator::make($request->all(), [
            'dob' => 'date'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'DOB format should be Y-m-d.'], 401);

        }
        
        $validator = Validator::make($request->all(), [
            'profile_pic' => 'image|mimes:jpeg,png,jpg,gif,svg,avif, webp'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'The profile picture must be an image file of type jpeg, png, jpg, gif, 
            or svg.'], 401);

        }
        
        $user = User::create([
            'role_id' => 2,
            'full_name' => $request->full_name,
            'email' => $request->email,
            'mobile_number' => $request->mobile_number,
            'password' => Hash::make($request->password),
            'is_active' => true, 
            'device_id' => $request->device_id,
            'device_token' => $request->device_token,
        ]);

        $profilePicPath = null;
        if ($request->hasFile('profile_pic')) {
            $secretname = Helper::generateToken($user->id);
            $imageName = $secretname . strtotime(date('Y-m-d H:i:s')) . '.jpg';
            $request->file('profile_pic')->move(public_path('images/user'), $imageName);

            $profilePicPath = $imageName;
        }

        $userDetail = UserDetail::create([
            'user_id' => $user->id,
            'dob' => date('Y-m-d', strtotime($request->dob)) ?? null,            
            'profile_pic' => $profilePicPath,
            'relationship' => $request->relationship,
        ]);

        $token = JWTAuth::fromUser($user);
        User::where('id', $user->id)->update(['token' => $token]);
        $user = User::find($user->id);
        
        return response()->json([
            'success' => true,
            'message' => 'Parent registered successfully',
            'data' => $user->load('userDetails'),
        ], 201);
    }

   
     public function signin(Request $request)
    {   
        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required',
            'device_id' => 'required',
            'device_token' => 'required',
        ]);
    
        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'email, password, device_id, device_token are required'], 401);
        }
    
        $user = User::where('email', $request->email)->first();
        if($user == '') {
            return response()->json(['success' => false, 'message' => 'Email not found. Please create your account!'], 401);
        }
    
        $credentials = $request->only('email', 'password');
    
       if (Auth::attempt($credentials)) {
            $user = Auth::user(); 
            $token = JWTAuth::fromUser($user); 
            $update = array('last_logged_in' => date('Y-m-d'),
                            'token' => $token,
                            'device_id' => $request->device_id,
                            'device_token' => $request->device_token);
                            
            User::where('id', $user->id)->update($update);
            
            $user = User::find($user->id);
           
            return response()->json([ 'success' => true, 'message' => 'Login successfully',
                            'data' => $user->load('userDetails')], 200);
        } else {
             return response()->json([ 'success' => true, 'message' => 'Invalid email / password'],404);
        }
    }

    public function changePassword(Request $request)
    {
        $validatedData = Validator::make($request->all() ,[
            'email' => 'required'
        ]);
        
        if ($validatedData->fails()) {
             return response()->json(['success' => false, 'message' => 'Email required.'], 401);
        }     

        $email = $request->email;
        
        $user = User::where('email', $email)->first();
        if($user == '') {
            return response()->json(['success' => false, "message" => 'Invalid email'], 404);
        }
    
        $user = User::where('email', $email)->first();
        $id = Crypt::encrypt($user->id);
        $link = $_ENV['APP_URL'].'user/reset-password/'.$id;
        return response()->json(['success' => true, 
                                    'message' => 'Forgot password link has sent to your registered email. Please check your email.',
                                    'data' => $link], 201);
    
    }    
    
     /*
    ** logout
    */
    public function logout(Request $request) {
        $token = $request->header('Authorization');

        $user = Helper::checkToken($token);
        
        if(isset($user->original['message'])) {
            return response()->json(['success' => false, 'message' => 'Unauthorized', 'data' => []], 401);
        }
        
        $user->update(['token' => NULL, 'device_token' => NULL, 'device_id' => NULL]);
        return response()->json(['success' => true, 'message' => 'User successufully logout'], 200);
        
    }
    
     /*
    ** refresh jwt token
    */
    public function refreshToken($user_id) {
       $user_id = intval($user_id);
       $user = User::find($user_id); 

        if ($user) {
            $token = JWTAuth::fromUser($user);
            User::where('id', $user->id)->update(['token' => $token]);
            return response()->json(['success' => true, 'token' => $token], 200);
        } else {
            
            return response()->json(['success' => false, 'message' => 'User not found'], 200);
        }
    } 
    
}
