<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class DocumentDataRequest extends FormRequest
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
            'document' => 'nullable|file',
            'document_category_id' => 'required|integer|numeric|exists:document_categories,id',
            'user_id' => 'nullable|integer|numeric|exists:users,id',
            'title' => [
                'required', 'string', 'max:64',
                Rule::unique('documents')->ignore($this->document),
            ],
        ];

        if (!$this->document) {
            $rules['document'] = 'required|file';
            $rules['title'] = 'required|string|max:64|unique:documents';
        }

        return $rules;
    }
}
