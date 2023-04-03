<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class TattooistDataRequest extends FormRequest
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
            'is_resident' => 'boolean',
            'is_admin' => 'boolean',
            'is_active' => 'boolean',
            'name' => [
                'required', 'string', 'max:64',
                Rule::unique('tattooists')->ignore($this->tattooist),
            ],
            'email' => [
                'required', 'email', 'max:128',
                Rule::unique('tattooists')->ignore($this->tattooist),
            ],
            'description' => 'nullable|string',
        ];

        if (!$this->tattooist) {
            $rules['name'] = 'required|string|max:64|unique:tattooists';
            $rules['email'] = 'required|email|max:128|unique:tattooists';
        }

        return $rules;
    }
}
