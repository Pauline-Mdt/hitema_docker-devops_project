<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Document extends Model
{
    use HasFactory;

    protected $fillable = [
        'document_category_id',
        'user_id',
        'title',
        'name',
        'extension',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];

    protected $appends = [
        'document_category_name',
        'url',
    ];

    public function documentCategory()
    {
        return $this->belongsTo(DocumentCategory::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function getUrlAttribute()
    {
        return Storage::url('documents/'.$this->name);
    }

    public function getDocumentCategoryNameAttribute()
    {
//        return 'test';
        return $this->documentCategory->name;
//        return DocumentCategory::query()->where('id', $this->documentCategory->id)->first('name')->name;
    }
}
