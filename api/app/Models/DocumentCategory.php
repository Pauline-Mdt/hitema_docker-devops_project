<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DocumentCategory extends Model
{
    use HasFactory;

    protected $attributes = [
        'is_private' => 1,
    ];

    protected $fillable = [
        'name',
        'is_private',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];

    public function documents()
    {
        return $this->hasMany(Document::class);
    }
}
