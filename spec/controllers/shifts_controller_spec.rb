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
      expect(parsed_response['shifts'][9]['start_date']).to eq('2017-01-01')
      expect(parsed_response['shifts'][9]['worker_firstname']).to eq('Julie')
      expect(parsed_response['shifts'][8]['start_date']).to eq('2017-01-02')
      expect(parsed_response['shifts'][8]['worker_firstname']).to eq('Marc')
      expect(parsed_response['shifts'][7]['start_date']).to eq('2017-01-03')
      expect(parsed_response['shifts'][7]['worker_firstname']).to eq('Antoine')
      expect(parsed_response['shifts'][6]['start_date']).to eq('2017-01-04')
      expect(parsed_response['shifts'][6]['worker_firstname']).to eq('Emilie')
      expect(parsed_response['shifts'][5]['start_date']).to eq('2017-01-05')
      expect(parsed_response['shifts'][5]['worker_firstname']).to eq('Lea')
      expect(parsed_response['shifts'][4]['start_date']).to eq('2017-01-06')
      expect(parsed_response['shifts'][4]['worker_firstname']).to eq('Marc')
      expect(parsed_response['shifts'][3]['start_date']).to eq('2017-01-07')
      expect(parsed_response['shifts'][3]['worker_firstname']).to eq('Lea')
      expect(parsed_response['shifts'][2]['start_date']).to eq('2017-01-08')
      expect(parsed_response['shifts'][2]['worker_firstname']).to eq('Emilie')
      expect(parsed_response['shifts'][1]['start_date']).to eq('2017-01-09')
      expect(parsed_response['shifts'][1]['worker_firstname']).to eq('Lea')
      expect(parsed_response['shifts'][0]['start_date']).to eq('2017-01-10')
      expect(parsed_response['shifts'][0]['worker_firstname']).to eq('Marc')
    end
  end

  describe "when POST #create " do
    it "with worker_id params, returns http success and shift is assigned to worker with id eq worker_id" do
      julie = Worker.where(first_name: 'Julie').first
      post :create, xhr: true, params: { shift: { start_date: '2019-01-10', worker_id: julie.id } }
      expect(response).to have_http_status(:success)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['message']).to eq 'The shift on 2019-01-10 was created successfully'
      created_shift = Shift.last
      expect(created_shift.start_date.to_s).to eq '2019-01-10'
      expect(created_shift.worker) == julie
    end

    it "without worker_id params, returns http success and shift is assigned to no worker" do
      post :create, xhr: true, params: { shift: { start_date: '2029-01-10' } }
      expect(response).to have_http_status(:success)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['message']).to eq 'The shift on 2029-01-10 was created successfully'
      created_shift = Shift.last
      expect(created_shift.start_date.to_s).to eq '2029-01-10'
      expect(created_shift.worker_id.nil?).to be true
    end

    it "with bad params, returns http unprocessable_entity" do
      post :create, xhr: true, params: { shift: { start_date: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['errors'].include?("Start date can't be blank")).to be true
    end
  end


  describe "when PUT #update " do
    it "with good params, returns http success and shift is updated" do
      shift_to_update = Shift.find_by(start_date: '2017-1-1')
      lea = Worker.find_by(first_name: 'Lea')
      put :update, xhr: true, params: { id: shift_to_update.id,
        shift: { start_date: '2030-09-20', worker_id: lea.id } }
      expect(response).to have_http_status(:success)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['message']).to eq 'The shift on 2030-09-20 was updated successfully'
      updated_shift = Shift.find(shift_to_update.id)
      expect(updated_shift.start_date.to_s).to eq '2030-09-20'
      expect(updated_shift.worker_id).to eq lea.id
    end

    it "with bad params, returns http success and shift doesn't change" do
      shift_to_update = Shift.find_by(start_date: '2017-1-1')
      put :update, xhr: true, params: { id: shift_to_update.id, shift: { start_date: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['errors'].include?("Start date can't be blank")).to be true
    end
  end


end
