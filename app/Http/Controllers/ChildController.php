<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Helpers\Helper;
use App\Models\User;
use App\Models\UserDetail;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class ChildController extends Controller
{
    public function index()
    {  
    
	}
	
	public function addChild(Request $request) {
        $validator = Validator::make($request->all(), [
            'parent_id' => 'required',
            'full_name' => 'required',
            'email' => 'required',
            'gender' => 'required',
            'dob' => 'nullable',
            'class' => 'required',
            'mailing_address' => 'nullable',
            'experience' => 'required',
            'comment' => 'nullable',
            'device_id' => 'required',
            'device_token' => 'required',
            'profile_pic' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'parent_id, full_name, email, password, gender, class, experience, device_id, device_token are required'], 401);

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
            return response()->json(['success' => false, 'message' => 'Email id already exist.'], 401);

        } 
       
        $validator = Validator::make($request->all(), [
            'dob' => 'date'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'DOB format should be Y-m-d.'], 401);

        }
        
        $validator = Validator::make($request->all(), [
            'profile_pic' => 'image'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'The profile picture must be an image file.'], 401);

        }
        
        $validator = Validator::make($request->all(), [
            'parent_id' => 'integer'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'parent id should be integer.'], 401);

        }
        
        $user = User::create([
            'role_id' => 1,
            'full_name' => $request->full_name,
            'email' => $request->email,
            'password' => Hash::make('12345678'),
            'is_active' => true, 
            'device_id' => $request->device_id,
            'device_token' => $request->device_token,
            'parent_id' => $request->parent_id,
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
            'mailing_address' => $request->mailing_address ?? null,
            'experience' => $request->experience ?? null,
            'comment' => $request->comment ?? null,
            'profile_pic' => $profilePicPath,
        ]);
        
        return response()->json([
            'success' => true,
            'message' => 'Child added successfully',
            'data' => $user->load('userDetails'),
        ], 201);
    }

	public function getChild($parent_id)
    {  
        $user = User::find($parent_id);
        if($user == '') {
            return response()->json(['success' => false, 'message' => 'Parent not Found.', 'data' => []], 404);
        }
        
        $children = User::where('parent_id', $parent_id)->latest()->get();
        return response()->json(['success' => true, 'message' => 'Child List.', 'data' => $children->load('userDetails')], 200);
	}
	
	public function updateChild(Request $request) {
        $validator = Validator::make($request->all(), [
            'child_id' => 'required',
            'full_name' => 'required',
            'email' => 'required',
            'gender' => 'required',
            'dob' => 'nullable',
            'class' => 'required',
            'mailing_address' => 'nullable',
            'experience' => 'required',
            'comment' => 'nullable',
            'profile_pic' => 'nullable',
        ]);
    
        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => $validator->errors()->first()], 401);
        }
        
        $validator = Validator::make($request->all(), [
            'email' => 'email'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Invalid email format.'], 401);

        }
       
        $validator = Validator::make($request->all(), [
            'dob' => 'date'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'DOB format should be Y-m-d.'], 401);

        }
        
        $validator = Validator::make($request->all(), [
            'profile_pic' => 'image'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'The profile picture must be an image file of type jpeg, png, jpg, gif, 
            or svg.'], 401);

        }
        
        $validator = Validator::make($request->all(), [
            'child_id' => 'integer'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'child id should be integer.'], 401);

        }
        
        
    
        // Update the user details
        $user = User::where('id', $request->child_id)->first();
        if (!$user) {
            return response()->json(['success' => false, 'message' => 'User not found.'], 404);
        }
    
        $user->update([
            'full_name' => $request->full_name,
            'email' => $request->email,
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
    
        // Update the user details
        $userDetail = UserDetail::where('user_id', $request->child_id)->update([
            'gender' => $request->gender,
            'dob' => $request->dob ? date('Y-m-d', strtotime($request->dob)) : null,
            'class' => $request->class,
            'mailing_address' => $request->mailing_address ?? null,
            'experience' => $request->experience ?? null,
            'comment' => $request->comment ?? null,
            'profile_pic' => $profilePicPath,
        ]);
        if($user->parent_id != '') {
            return response()->json([
                'success' => true,
                'message' => 'Child successfully updated',
                'data' => $user->load('userDetails'),
            ], 200);
        } else {
            return response()->json([
                'success' => true,
                'message' => 'Your profile has been successfully updated',
                'data' => $user->load('userDetails'),
            ], 200);
        }
    }

	public function deleteChild($id) {
	    $user = User::find($id);
        if($user == '') {
            return response()->json(['success' => false, 'message' => 'Child not Found.', 'data' => []], 404);
        }
        
        $profilePicPath = $user->userDetails->profile_pic ?? null;
    
        if ($profilePicPath && file_exists(public_path('images/user/' . $profilePicPath))) {
            unlink(public_path('images/user/' . $profilePicPath));
        }
        
        UserDetail::where('user_id', $id)->delete();
        $user->delete();

        return response()->json(['success' => true, 'message' => 'Child deleted successfully.'], 200);
    
	}
}





















