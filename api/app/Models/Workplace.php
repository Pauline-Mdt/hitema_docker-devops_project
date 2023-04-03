<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Workplace extends Model
{
    use HasFactory;

    protected $attributes = [
        'is_pmr' => 0,
    ];

    protected $fillable = [
        'number',
        'is_pmr',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];

    public function tattooistsWorkplaces()
    {
        return $this->hasMany(TattooistWorkplace::class);
    }
}
