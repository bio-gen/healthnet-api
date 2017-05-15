require 'rails_helper'

RSpec.describe Api::V1::UserTokenController, type: :routing do
  describe 'authentication routing' do
    it 'routes to /v1/auth to user_token#create' do
      expect(:post => '/v1/auth').to route_to('api/v1/user_token#create')
    end
  end
end