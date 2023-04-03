<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class SubscriberDataRequest extends FormRequest
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
            'email' => [
                'required', 'email', 'max:128',
                Rule::unique('subscribers')->ignore($this->subscriber),
            ],
        ];

        if (!$this->subscriber) {
            $rules['email'] = 'required|email|max:128|unique:subscribers';
        }

        return $rules;
    }
}
