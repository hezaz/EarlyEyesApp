<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Helpers\Helper;
use App\Models\Banner;
use App\Models\Contact;
use App\Models\Event;
use App\Models\User;
use App\Models\UserDetail;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Helpers\TokenHelper;
use Tymon\JWTAuth\Facades\JWTAuth;

class ProfileController extends Controller
{
    public function profile(Request $request)
    {  
        $token = $request->header('Authorization');
        $user = Helper::checkToken($token);
       
        if(isset($user->original['message'])) {
            return response()->json(['success' => false, 'message' => 'Unauthorized', 'data' => []], 401);
        }
        
        $user = User::with(['userDetails'])->where('id', $user->id)->first();

        return response()->json(['success' => true, 'message' => 'Profile', 'data' => $user], 200);
	}
	
	public function changePassword(Request $request)
    {
        $token = $request->header('Authorization');
        $user = Helper::checkToken($token);
        
        if(isset($user->original['message'])) {
            return response()->json(['success' => false, 'message' => 'Unauthorized', 'data' => []], 401);
        }
        
        $validator = Validator::make($request->all(), [
            'old_password' => 'required',
            'new_password' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, "message" => 'old password & new password required.', 'data'=>[]], 400);
        }
        
        $user = User::find($user->id);
        if (!Hash::check($request->old_password, $user->password)) {
            return response()->json(['success' => false, 'message' => 'Old password is incorrect.', 'data' => []], 400);
        }
    
        $user->password = Hash::make($request->new_password);
        $user->save();
    
        return response()->json(['success' => true, 'message' => 'Password changed successfully.', 'data' => $user], 200);
    }	
    
    public function deleteAccount(Request $request)
    {
        $token = $request->header('Authorization');
        $user = Helper::checkToken($token);
        
        if(isset($user->original['message'])) {
            return response()->json(['success' => false, 'message' => 'Unauthorized', 'data' => []], 401);
        }
        
        $child = User::where('parent_id', $user->id)->get();
        if(isset($child) && count($child) > 0) {
            foreach($child as $ch) {
                $profilePicPath = $ch->userDetails->profile_pic ?? null;
    
                if ($profilePicPath && file_exists(public_path('images/user/' . $profilePicPath))) {
                    unlink(public_path('images/user/' . $profilePicPath));
                }
                
                UserDetail::where('user_id', $ch->id)->delete();
            }
            
        }
        User::where('parent_id', $user->id)->delete();
        
        $profilePicPath = $user->userDetails->profile_pic ?? null;
    
        if ($profilePicPath && file_exists(public_path('images/user/' . $profilePicPath))) {
            unlink(public_path('images/user/' . $profilePicPath));
        }
        
        UserDetail::where('user_id', $user->id)->delete();
        $user->delete();
        return response()->json(['success' => true, 'message' => 'Account deleted successfully.', 'data' =>[]], 200);
    }
    
    public function addBanner(Request $request)
    {  
        $token = $request->header('Authorization');
        $user = Helper::checkToken($token);
       
        if(isset($user->original['message'])) {
            return response()->json(['success' => false, 'message' => 'Unauthorized', 'data' => []], 401);
        }
        
        $validator = Validator::make($request->all(), [
            'image' => 'required|image',
            'description'=>'nullable'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Upload valid image'], 401);
        }
        
        // Save the new profile picture
        $secretname = Helper::generateToken($user->id);
        $imageName = 'banner_'.$secretname.'_'.strtotime(date('Y-m-d H:i:s')) . '.jpg';
        $request->file('image')->move(public_path('images/user/banner'), $imageName);
        
        $banner = Banner::create(
            [
                'image' => $_ENV['APP_URL'].'public/images/user/banner/'.$imageName,
                'image_name' => $imageName,
                'user_id' => $user->id,
                'description' => $request->description
            ]
        );
        
        $banner = Banner::find($banner->id);
        return response()->json([
            'success' => true,
            'message' => 'Banner uploaded successfully',
            'data' => $banner,
        ], 201);
	}
	
	public function supportHelp(Request $request)
    {  
        $token = $request->header('Authorization');
        $user = Helper::checkToken($token);
       
        if(isset($user->original['message'])) {
            return response()->json(['success' => false, 'message' => 'Unauthorized', 'data' => []], 401);
        }
        
        $validator = Validator::make($request->all(), [
            'course_id' => 'required',
            'message'=>'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Course and message field required'], 401);
        }
        
        $contact = Contact::create(
            [
                'user_id' => $user->id,
                'course_id' => $request->course_id,
                'message' => $request->message
            ]
        );
        
        return response()->json([
            'success' => true,
            'message' => 'Your enquiry has successfully submitted.',
        ], 201);
	}
    
    /*
    ** get event
    */
    public function events() {
        $events = Event::latest()->get();
        return response()->json([
            'success' => true,
            'message' => 'Events',
            'data' => $events
        ], 200);
    }  
    
    /*
    ** get banner
    */
    public function banners() {
        $bn = Banner::latest()->get();
        return response()->json([
            'success' => true,
            'message' => 'Banner',
            'data' => $bn
        ], 201);
    } 
}






















