require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  describe 'POST /v1/auth_user' do
    let(:user) { FactoryGirl.create(:user, email: 'test@test.com') }

    it 'returns a valid JWT auth token' do
      post '/v1/auth_user', params: { email: user.email, password: user.password }, headers: {}

      expect(response).to have_http_status 200

      auth_token = JSON.parse(response.body)['auth_token']
      claims = JsonWebToken.decode(auth_token)

      expect(claims['user_id']).to eq(user.id)
    end
  end
end