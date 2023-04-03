<?php

namespace App\Http\Requests;

use App\Models\Picture;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class PictureDataRequest extends FormRequest
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
            'picture' => 'nullable|image',
            'tattooist_id' => 'nullable|integer|numeric|exists:tattooists,id',
            'is_main' => 'boolean',
            'is_visible' => 'boolean',
        ];

//        $tattooistId = (!$this->tattooist_id) ? $this->picture->tattooist->id : $this->tattooist_id;
//        if ($this->is_main == 1) {
//            $rules['is_main'] = [
//                'boolean',
//                Rule::unique('pictures')
//                    ->where('tattooist_id', $tattooistId)
//                    ->where('is_main', 1)
//                    ->ignore($this->picture)
//            ];
//        }

        if (!$this->picture) {
            $rules['tattooist_id'] = 'required|integer|numeric|exists:tattooists,id';
            $rules['picture'] = 'required|image';
        }

        return $rules;
    }
}
