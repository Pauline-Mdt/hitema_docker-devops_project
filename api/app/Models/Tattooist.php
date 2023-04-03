<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tattooist extends Model
{
    use HasFactory;

    protected $attributes = [
        'is_resident' => 0,
        'is_active' => 0,
    ];

    protected $fillable = [
        'is_resident',
        'is_active',
        'name',
        'email',
        'description',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];

    public function user()
    {
        return $this->hasOne(User::class);
    }

    public function pictures()
    {
        return $this->hasMany(Picture::class);
    }

    public function socialNetworksTattooist()
    {
        return $this->hasMany(SocialNetworkTattooist::class)
            ->join('social_networks', 'social_network_tattooist.social_network_id', '=', 'social_networks.id')
            ->select('social_network_tattooist.*', 'social_networks.name as social_network_name')
            ->where('tattooist_id', $this->id);
    }

    public function tattooistWorkplaces()
    {
        return $this->hasMany(TattooistWorkplace::class);
    }

    public function picturesByMain($isMain)
    {
        return Picture::query()->where('tattooist_id', $this->id)
            ->where('is_main', $isMain)
            ->get();
    }
}
