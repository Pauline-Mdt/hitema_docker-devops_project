<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class TattooistWorkplaceDataRequest extends FormRequest
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
            'workplace_id' => 'required|integer|numeric|exists:workplaces,id',
            'tattooist_id' => 'required|integer|numeric|exists:tattooists,id',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal::start_date',
//            Rule::unique('tattooist_workplace', ['workplace_id', 'tattooist_id', 'start_date'])->ignore($this->tattooistWorkplace),
        ];

//        if (!$this->tattooistWorkplace) {
//            Rule::unique('tattooist_workplace', ['workplace_id', 'tattooist_id', 'start_date']);
//        }

        return $rules;
    }
}
