<?php
namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'role_id', 'full_name', 'email', 'password', 'is_active', 
        'device_id', 'device_token','mobile_number','parent_id','token','last_logged_in'
    ];

    protected $hidden = [
        'password', 'remember_token', 'device_id', 'device_token'
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function userDetails()
    {
        return $this->hasOne(UserDetail::class);
    }
    
    public function parent()
    {
        return $this->belongsTo(User::class, 'parent_id');
    }

    public function children()
    {
        return $this->hasMany(User::class, 'parent_id');
    }
    
    public function banners()
    {
        return $this->hasMany(Banner::class);
    }

     public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }
    public function courses()
    {
        return $this->hasMany(Course::class, 'instructor_assignment');
    }
}
