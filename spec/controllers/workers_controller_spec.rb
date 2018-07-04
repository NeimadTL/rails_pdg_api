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
      expect(parsed_response['workers'][4]['first_name']).to eq("Julie")
      expect(parsed_response['workers'][4]['price']).to eq(540)
      expect(parsed_response['workers'][3]['first_name']).to eq("Marc")
      expect(parsed_response['workers'][3]['price']).to eq(810)
      expect(parsed_response['workers'][2]['first_name']).to eq("Antoine")
      expect(parsed_response['workers'][2]['price']).to eq(126)
      expect(parsed_response['workers'][1]['first_name']).to eq("Emilie")
      expect(parsed_response['workers'][1]['price']).to eq(810)
      expect(parsed_response['workers'][0]['first_name']).to eq("Lea")
      expect(parsed_response['workers'][0]['price']).to eq(1920)
      expect(parsed_response['commission']['pdg_fee']).to eq(450.3)
      expect(parsed_response['commission']['cover_shifts']).to eq(3)
    end
  end


  describe "when POST #create " do
    it "with good params, returns http success and worker is created" do
      post :create, xhr: true, params: { worker: { first_name: "Damien", status: 'cover' } }
      expect(response).to have_http_status(:success)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['message']).to eq 'The worker Damien was created successfully'
      created_worker = Worker.last
      expect(created_worker.first_name).to eq 'Damien'
      expect(created_worker.status).to eq 'cover'
    end

    it "with bad params, returns http unprocessable_entity" do
      post :create, xhr: true, params: { worker: { first_name: nil, status: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['errors'].include?("First name can't be blank")).to be true
      expect(parsed_body['errors'].include?("Status can't be blank")).to be true
    end
  end

  describe "when PUT #update " do
    it "with good params, returns http success and worker is updated" do
      worker_to_update = Worker.find_by(first_name: 'Julie')
      put :update, xhr: true, params: { id: worker_to_update.id, worker: { first_name: "Julia", status: 'cover' } }
      expect(response).to have_http_status(:success)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['message']).to eq 'The worker Julia was updated successfully'
      updated_worker = Worker.find(worker_to_update.id)
      expect(updated_worker.first_name).to eq 'Julia'
      expect(updated_worker.status).to eq 'cover'
    end

    it "with bad params, returns http success and worker doesn't change" do
      worker_to_update = Worker.find_by(first_name: 'Julie')
      put :update, xhr: true, params: { id: worker_to_update.id, worker: { first_name: "Julia", status: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
      parsed_body = JSON.parse(response.body)
      expect(parsed_body['errors'].include?("Status can't be blank")).to be true
    end
  end




end
