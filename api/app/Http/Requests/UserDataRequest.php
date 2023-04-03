<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules\Password;

class UserDataRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = [
            'tattooist_id' => [
                'nullable', 'integer', 'numeric', 'exists:tattooists,id',
                Rule::unique('users')->ignore($this->user),
            ],
            'is_admin' => 'boolean',
            'first_name' => 'required|string|max:64',
            'last_name' => 'required|string|max:64',
            'email' => [
                'required', 'email', 'max:128',
                Rule::unique('users')->ignore($this->user),
            ],
        ];

        if (!$this->user) {
            $rules['tattooist_id'] = 'nullable|integer|numeric|exists:tattooists,id';
            $rules['email'] = 'required|email|max:128|unique:users';
            $rules['password'] = [
                'required', 'string',
                Password::min(12)
                ->letters()
                ->mixedCase()
                ->numbers()
                ->symbols()
            ];
        }

        return $rules;
    }
}
