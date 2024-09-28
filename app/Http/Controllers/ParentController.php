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

class ParentController extends Controller
{
    public function updateParent(Request $request)
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
            'relationship' => 'required',
            'dob' => 'nullable',            
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
            'dob' => 'date'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'DOB format should be Y-m-d.'], 401);

        }
        
          $validator = Validator::make($request->all(), [
            'profile_pic' => 'image'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'The profile picture must be an image.'], 401);

        }
        
        $existingUser = User::where('email', $request->email)->where('id', '!=', $user->id)->first();
        if ($existingUser) {
            return response()->json(['success' => false, 'message' => 'Email address already in use.'], 401);
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
                'dob' => date('Y-m-d', strtotime($request->dob)) ?? null,            
                'profile_pic' => $profilePicPath,
                'relationship' => $request->relationship,
            ]
        );

        $user = User::with('userDetails')->find($user->id);
        return response()->json([
            'success' => true,
            'message' => 'Parent updated successfully',
            'data' => $user,
        ], 201);
    }
}
