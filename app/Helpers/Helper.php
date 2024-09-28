<?php

namespace App\Helpers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Response;
use App\Models\User;
use DB;

class Helper {	

    public static function generateToken($id) {
        $encrypt_method = "AES-256-CBC";
        $secret_key = 'qpzWUm1fRNGklS5aIPs09LxK1fRNGklS';
        $secret_iv = 'pMXboBlu3ar79vFdRIzZt5gH';
        $key = hash('sha256', $secret_key); 
        $iv = substr(hash('sha256', $secret_iv), 0, 16);
        return base64_encode(openssl_encrypt($id,$encrypt_method, $key, 0, $iv));
    }

     public static function generateKey($keyLength) {
        $key = "";
        for ($x = 1; $x <= $keyLength; $x++) {
            $key .= random_int(0, 9);
        }
        return $key;
    }
    
    public static function checkToken($token)
    {
        if (!$token) {
            return response()->json(['success' => false, 'message' => 'Unauthorized'], Response::HTTP_CONFLICT);
        }
    
        $jwtToken = str_replace('Bearer ', '', $token);
    
        try {
            $user = Auth::guard('api')->authenticate($jwtToken);
            if (!$user) {
                return response()->json(['success' => false, 'message' => 'Unauthorized'], Response::HTTP_CONFLICT);
            }
        } catch (\Tymon\JWTAuth\Exceptions\TokenExpiredException $e) {
            return response()->json(['success' => false, 'message' => 'Token Expired'], Response::HTTP_CONFLICT);
        } catch (\Tymon\JWTAuth\Exceptions\TokenInvalidException $e) {
            return response()->json(['success' => false, 'message' => 'Token Invalid'], Response::HTTP_CONFLICT);
        } catch (\Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['success' => false, 'message' => 'Token Absent'], Response::HTTP_CONFLICT);
        }
    
        return $user;
    }
}