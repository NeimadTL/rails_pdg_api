require 'rails_helper'

RSpec.describe ShiftsController, type: :controller do

  describe "when GET #index" do
    it 'returns http succes' do
      get :index, xhr: true
      expect(response).to have_http_status(:success)
    end

    it 'returns all the shifts' do
      get :index, xhr: true
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['shifts'].length).to eq(10)
      expect(parsed_response['shifts'][0]['start_date']).to eq('2017-01-01')
      expect(parsed_response['shifts'][0]['worker']).to eq('Julie')
      expect(parsed_response['shifts'][1]['start_date']).to eq('2017-01-02')
      expect(parsed_response['shifts'][1]['worker']).to eq('Marc')
      expect(parsed_response['shifts'][2]['start_date']).to eq('2017-01-03')
      expect(parsed_response['shifts'][2]['worker']).to eq('Antoine')
      expect(parsed_response['shifts'][3]['start_date']).to eq('2017-01-04')
      expect(parsed_response['shifts'][3]['worker']).to eq('Emilie')
      expect(parsed_response['shifts'][4]['start_date']).to eq('2017-01-05')
      expect(parsed_response['shifts'][4]['worker']).to eq('Lea')
      expect(parsed_response['shifts'][5]['start_date']).to eq('2017-01-06')
      expect(parsed_response['shifts'][5]['worker']).to eq('Marc')
      expect(parsed_response['shifts'][6]['start_date']).to eq('2017-01-07')
      expect(parsed_response['shifts'][6]['worker']).to eq('Lea')
      expect(parsed_response['shifts'][7]['start_date']).to eq('2017-01-08')
      expect(parsed_response['shifts'][7]['worker']).to eq('Emilie')
      expect(parsed_response['shifts'][8]['start_date']).to eq('2017-01-09')
      expect(parsed_response['shifts'][8]['worker']).to eq('Lea')
      expect(parsed_response['shifts'][9]['start_date']).to eq('2017-01-10')
      expect(parsed_response['shifts'][9]['worker']).to eq('Marc')
    end

  end

end
