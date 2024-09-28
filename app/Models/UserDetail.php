<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class UserDetail extends Model
{
    use HasFactory;
    protected $primaryKey = "id";

    protected $table = 'user_details';
    protected $fillable = [
         "user_id", "gender", "dob", "class", "student_email", "mailing_address", "experience", 
         "comment", "profile_pic", "tutor_email", "school_name", "course_id","course_name", "course_schedule", "relationship","parent_id",
         "created_at", "updated_at"
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
    public function course()
    {
        return $this->belongsTo(Course::class, 'course_id', 'id');
    }
}
