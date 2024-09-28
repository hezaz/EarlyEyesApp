<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    use HasFactory;
    protected $primaryKey = "id";

    protected $table = 'courses';
    protected $fillable = ['course_title', 'course_category', 'course_duration', 'course_level', 'price', 
                        'enrollment_limit', 'course_description', 'instructor_assignment', 'course_thumbnails', 
                        'course_materials', 'course_date', 'status', 'created_at', 'updated_at'];
                        
    public function instructor()
    {
        return $this->belongsTo(User::class, 'instructor_assignment');
    }
    
    public function userDetails()
    {
        return $this->hasMany(UserDetail::class, 'course_id', 'id');
    }

}
