<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class DocumentCategoryDataRequest extends FormRequest
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
            'name' => [
                'required', 'string', 'max:32',
                Rule::unique('document_categories')->ignore($this->documentCategory),
            ],
            'is_private' => 'boolean',
        ];

        if (!$this->documentCategory) {
            $rules['name'] = 'required|string|max:32|unique:document_categories';
        }

        return $rules;
    }
}
