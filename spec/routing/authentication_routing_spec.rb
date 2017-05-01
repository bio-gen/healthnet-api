require 'rails_helper'

RSpec.describe Api::V1::AuthenticationController, type: :routing do
  describe 'routing' do
    it 'routes to /v1/auth' do
      expect(:post => '/v1/auth').to route_to('api/v1/user_token#create')
    end
  end
end