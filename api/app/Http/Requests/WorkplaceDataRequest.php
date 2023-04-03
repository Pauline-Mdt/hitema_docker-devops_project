<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class WorkplaceDataRequest extends FormRequest
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
            'number' => [
                'required', 'integer', 'numeric',
                Rule::unique('workplaces')->ignore($this->workplace),
            ],
            'is_pmr' => 'boolean',
        ];

        if (!$this->workplace) {
            $rules['number'] = 'required|integer|numeric|unique:workplaces';
        }

        return $rules;
    }
}
