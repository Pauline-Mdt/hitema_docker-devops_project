<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class SocialNetwork extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];

    protected $appends = [
        'logo_url',
    ];

    public function socialNetworksTattooists()
    {
        return $this->hasMany(SocialNetworkTattooist::class);
    }

    public function getLogoUrlAttribute()
    {
        return Storage::url('storage/logos/'.$this->name.'.png');
    }
}
