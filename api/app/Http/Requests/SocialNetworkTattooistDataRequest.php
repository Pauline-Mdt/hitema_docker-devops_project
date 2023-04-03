<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class SocialNetworkTattooistDataRequest extends FormRequest
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
            'tattooist_id' => 'integer|numeric|exists:tattooists,id',
            'social_network_id' => 'integer|numeric|exists:social_networks,id',
            'url' => [
                'required', 'url', 'active_url',
                Rule::unique('social_network_tattooist')->ignore($this->socialNetworkTattooist),
            ],
//            Rule::unique('social_network_tattooist', ['tattooist_id', 'social_network_id'])->ignore($this->socialNetworkTattooist),
        ];

        if (!$this->socialNetworkTattooist) {
            $rules['tattooist_id'] = 'required|integer|numeric|exists:tattooists,id';
            $rules['social_network_id'] = 'required|integer|numeric|exists:social_networks,id';
            $rules['url'] = 'required|url|active_url|unique:social_network_tattooist';
//            Rule::unique('social_network_tattooist', ['tattooist_id', 'social_network_id']);
        }

        return $rules;
    }
}
