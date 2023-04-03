<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Picture extends Model
{
    use HasFactory;

    protected $attributes = [
        'is_main' => 0,
        'is_visible' => 1,
    ];

    protected $fillable = [
        'tattooist_id',
        'picture_id',
        'name',
        'is_main',
        'is_visible',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];

    protected $appends = [
        'url',
    ];

    public function tattooist()
    {
        return $this->belongsTo(Tattooist::class);
    }

    public function getUrlAttribute()
    {
        return Storage::url('storage/pictures/'.$this->name);
    }
}
