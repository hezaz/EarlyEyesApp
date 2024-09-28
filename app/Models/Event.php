<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    use HasFactory;
    protected $primaryKey = "id";

    protected $table = 'events';
    protected $fillable = ['event_name', 'event_url', 'image', 'created_at', 'updated_at'];
    
}
