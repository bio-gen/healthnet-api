require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  describe 'POST /v1/auth' do

    context 'valid request' do
      let(:user) { FactoryGirl.create(:user, email: 'test@test.com') }

      it 'returns a valid JWT auth token' do
        post '/v1/auth', params: { auth: {email: user.email, password: user.password} }, headers: {}

        expect(response).to have_http_status 201

        auth_token = JSON.parse(response.body)['jwt']
      end
    end

    context 'invalid request' do
      it 'returns 404 Not Found' do
        post '/v1/auth/', params: { auth: {email: 'lala@msn.com', password: 'hello'} }, headers: {}

        expect(response).to have_http_status 404
      end
    end

  end
end