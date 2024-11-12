<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    use HasFactory;
    protected $primaryKey = "id";

    protected $table = 'banners';
    protected $fillable = ['user_id', 'image', 'image_name', 'description', 'created_at', 'updated_at'];
                        
    public function user()
    {
        return $this->belongsTo(User::class);
    }

}