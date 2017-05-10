require 'rails_helper'

RSpec.describe 'Authentications', type: :request do

  describe 'POST /v1/auth' do
    context 'valid request' do
      let(:user) { FactoryGirl.create(:user, email: 'test@test.com') }

      before { post '/v1/auth', params: { auth: {email: user.email, password: user.password} }, headers: {} }

      it 'returns HTTP status 201' do
        expect(response).to have_http_status 201
      end

      it 'returns a valid JWT auth token' do
        expect(json_response[:jwt]).to eq(Knock::AuthToken.new(payload: {sub: user.id}).token)
      end
    end

    context 'invalid request' do
      before { post '/v1/auth/', params: { auth: {email: 'lala@msn.com', password: 'hello'} }, headers: {} }

      it 'returns 404 Not Found' do
        expect(response).to have_http_status 404
      end
    end

  end
end