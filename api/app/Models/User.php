<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $attributes = [
        'is_admin' => 0,
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'tattooist_id',
        'is_admin',
        'first_name',
        'last_name',
        'email',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
        'created_at',
        'updated_at',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function tattooist()
    {
        return $this->belongsTo(Tattooist::class);
    }

    public function documents()
    {
        return $this->hasMany(Document::class)
            ->join('document_categories', 'documents.document_category_id', '=', 'document_categories.id')
            ->select('documents.*', 'document_categories.name as document_category_name')
            ->where('user_id', $this->id)
            ->orWhereNull('user_id');
    }
}
