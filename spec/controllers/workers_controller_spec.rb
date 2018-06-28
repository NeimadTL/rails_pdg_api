require 'rails_helper'

RSpec.describe WorkersController, type: :controller do

  describe "when GET #index" do
    it 'returns http succes' do
      get :index, xhr: true
      expect(response).to have_http_status(:success)
    end

    it 'returns all the workers' do
      get :index, xhr: true
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['workers'].length).to eq(5)
      expect(parsed_response['workers'][0]['first_name']).to eq("Julie")
      expect(parsed_response['workers'][0]['price']).to eq(540)
      expect(parsed_response['workers'][1]['first_name']).to eq("Marc")
      expect(parsed_response['workers'][1]['price']).to eq(810)
      expect(parsed_response['workers'][2]['first_name']).to eq("Antoine")
      expect(parsed_response['workers'][2]['price']).to eq(126)
      expect(parsed_response['workers'][3]['first_name']).to eq("Emilie")
      expect(parsed_response['workers'][3]['price']).to eq(810)
      expect(parsed_response['workers'][4]['first_name']).to eq("Lea")
      expect(parsed_response['workers'][4]['price']).to eq(1920)
      expect(parsed_response['commission']['pdg_fee']).to eq(450.3)
      expect(parsed_response['commission']['cover_shifts']).to eq(3)
    end
  end

end
