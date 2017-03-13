require 'rails_helper'

RSpec.describe 'Users', type: :request do

  describe 'GET /v1/users' do
    it 'returns all users' do
      FactoryGirl.create(:user, email: 'john@test.com')
      FactoryGirl.create(:user, email: 'mike@test.com')

      get '/v1/users', headers: { 'Accept': 'application/vnd' }

      expect(response).to have_http_status 200

      body = JSON.parse(response.body)

      user_emails = body['data'].map { |user| user['attributes']['email'] }

      expect(user_emails).to match_array(['john@test.com', 'mike@test.com'])
    end
  end

  describe 'GET /v1/users/:id' do
    it 'returns the requested user' do
      FactoryGirl.create(:user, email: 'james@text.com', id: 1)

      get '/v1/users/1', headers: { 'Accept': 'application/vnd' }

      expect(response).to have_http_status 200

      body = JSON.parse(response.body)
      user_email = body['data']['attributes']['email']

      expect(user_email).to eq('james@text.com')
    end
  end

  describe 'POST /v1/users' do
    it 'creates and returns the new user' do
      new_user = {
        data: {
          type: 'users',
          attributes: {
            email: 'mike@test.com',
            password: '12345678',
            password_confirmation: '12345678'
          }
        }
      }

      post '/v1/users', params: new_user.to_json, headers: { 'Accept': 'application/vnd', 'Content-Type': 'application/vnd.api+json' }

      expect(response).to have_http_status 201

      body = JSON.parse(response.body)
      user_email = body['data']['attributes']['email']

      expect(user_email).to eq 'mike@test.com'
    end
  end

  describe 'PUT/PATCH /users/:id' do
    it 'updates the requested user' do
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

      expect(response).to have_http_status 200

      body = JSON.parse(response.body)
      user_email = body['data']['attributes']['email']

      expect(user_email).to eq('sarah2@test.com')
    end
  end

  describe 'DELETE /users/:id' do
    it 'deleted the requested user' do
      FactoryGirl.create(:user, id: 1)

      delete '/v1/users/1', headers: { 'Accept': 'application/vnd' }

      expect(response).to have_http_status 204
    end
  end
end