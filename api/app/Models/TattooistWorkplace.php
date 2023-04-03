<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TattooistWorkplace extends Model
{
    use HasFactory;

    protected $table = 'tattooist_workplace';

    protected $fillable = [
        'workplace_id',
        'tattooist_id',
        'start_date',
        'end_date',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];

    protected $with = [
        'workplace',
        'tattooist'
    ];

    public function workplace()
    {
        return $this->belongsTo(Workplace::class);
    }

    public function tattooist()
    {
        return $this->belongsTo(Tattooist::class);
    }
}
