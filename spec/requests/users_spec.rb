require 'rails_helper'

RSpec.describe 'Users', type: :request do

  describe 'GET /v1/users' do
    let!(:users) { FactoryGirl.create_list(:user_with_work_experiences, 10) }

    before { get '/v1/users', headers: { 'Accept': 'application/vnd' } }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns all users' do
      expect(json_response[:data].size).to eq(10)
    end
  end

  describe 'GET /v1/users/:id' do
    let!(:user) { FactoryGirl.create(:user_with_work_experiences, email: 'james@text.com', id: 1) }

    before { get '/v1/users/1', headers: { 'Accept': 'application/vnd' } }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns the requested user' do
      expect(json_response[:data][:attributes][:email]).to eq('james@text.com')
    end

    it 'returns work experiences' do
      expect(json_response[:data][:relationships][:work_experiences][:data].size).to eq(5)
    end
  end

  describe 'POST /v1/users' do
    before do
      new_user = {
        data: {
          type: 'users',
          attributes: {
            email: 'mike@test.com',
            password: '12345678',
            password_confirmation: '12345678',
            first_name: 'Doctor',
            last_name: 'Mengueche'
          }
        }
      }

      post '/v1/users', params: new_user.to_json, headers: { 'Accept': 'application/vnd', 'Content-Type': 'application/vnd.api+json' }
    end

    it 'returns HTTP status 201' do
      expect(response).to have_http_status 201
    end

    it 'creates and returns the new user' do
      expect(json_response[:data][:attributes][:email]).to eq('mike@test.com')
    end
  end

  describe 'PUT/PATCH /v1/users/:id' do
    before do
      FactoryGirl.create(:user, id: 1)

      updated_user = {
        data: {
          type: 'users',
          attributes: {
            email: 'sarah2@test.com'
          }
        }
      }

      put '/v1/users/1', params: updated_user.to_json, headers: { 'Accept': 'application/vnd', 'Content-Type': 'application/vnd.api+json' }
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'updates the requested user' do
      expect(json_response[:data][:attributes][:email]).to eq('sarah2@test.com')
    end
  end

  describe 'DELETE /v1/users/:id' do
    before do
      FactoryGirl.create(:user, id: 1)
      delete '/v1/users/1', headers: { 'Accept': 'application/vnd' }
    end

    it 'deleted the requested user' do
      expect(response).to have_http_status 204
    end
  end
end