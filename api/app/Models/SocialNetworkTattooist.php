<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class SocialNetworkTattooist extends Model
{
    use HasFactory;

    protected $table = 'social_network_tattooist';

    protected $fillable = [
        'tattooist_id',
        'social_network_id',
        'url',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];

    public function tattooist()
    {
        return $this->belongsTo(Tattooist::class);
    }

    public function socialNetwork()
    {
        return $this->belongsTo(SocialNetwork::class);
    }
}
