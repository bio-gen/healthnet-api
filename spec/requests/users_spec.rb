require 'rails_helper'

RSpec.describe 'Users', type: :request do

  describe 'GET /v1/users' do
    let!(:users) { FactoryGirl.create_list(:user, 10) }

    before { get '/v1/users', headers: { 'Accept': 'application/vnd' } }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns all users' do
      expect(json_response[:data].size).to eq(10)
    end
  end

  describe 'GET /v1/users/:id' do
    let!(:user) { FactoryGirl.create(:user, email: 'james@text.com', id: 1) }

    before do
      FactoryGirl.create_list(:work_experience, 5, user: user)
      FactoryGirl.create_list(:education, 3, user: user)

      get '/v1/users/1', headers: { 'Accept': 'application/vnd' }
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns the requested user' do
      expect(json_response[:data][:attributes][:email]).to eq('james@text.com')
    end

    it 'returns work experiences' do
      expect(json_response[:data][:relationships][:work_experiences][:data].size).to eq(5)
    end

    it 'returns educations' do
      expect(json_response[:data][:relationships][:educations][:data].size).to eq(3)
    end
  end

  describe 'POST /v1/users' do
    context 'when response is valid' do
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
    
    context 'when response is invalid' do
      before do
        new_user = {
          data: {
            type: 'users',
            attributes: {
              email: '',
              password: '12345678',
              password_confirmation: '12345678',
              first_name: 'John',
              last_name: 'Doe'
            }
          }
        }
  
        post '/v1/users', params: new_user.to_json, headers: { 'Accept': 'application/vnd', 'Content-Type': 'application/vnd.api+json' }
      end
      
      it 'returns HTTP status 422' do
        expect(response).to have_http_status 422
      end
      
      it 'returns JSON API error object' do
        expect(json_response[:errors][0][:source][:pointer]).to eq('/data/attributes/email')
      end
    end
  end

  describe 'PUT/PATCH /v1/users/:id' do
    context 'when response is valid' do
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
    
    context 'when response is invalid' do
      before do
        FactoryGirl.create(:user, id: 1)
        
        updated_user = {
          data: {
            type: 'users',
            attributes: {
              first_name: ''
            }
          }
        }
        
        put '/v1/users/1', params: updated_user.to_json, headers: { 'Accept': 'application/vnd', 'Content-Type': 'application/vnd.api+json' }
      end
      
      it 'returns HTTP status 422' do
        expect(response).to have_http_status 422
      end
      
      it 'returns JSON API error object' do
        expect(json_response[:errors][0][:source][:pointer]).to eq('/data/attributes/first_name')
      end
    end
  end

  describe 'DELETE /v1/users/:id' do
    let!(:user) { FactoryGirl.create(:user, id: 1) }
    before { delete '/v1/users/1', headers: { 'Accept': 'application/vnd' } }

    it 'deletes the requested user' do
      expect(response).to have_http_status 204
    end

  end
end