<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    use HasFactory;
    protected $primaryKey = "id";

    protected $table = 'quizes';
    
    protected $fillable = [
        'course_id', 'quiz', 'answer', 'option1', 'option2', 'option3', 'option4',
    ];

    public function course()
    {
        return $this->belongsTo(Course::class);
    }
}
