require 'rails_helper'

RSpec.describe Api::V1::AuthenticationController, type: :routing do
  describe 'routing' do
    it ' routes to /v1/auth_user' do
      expect(:post => '/v1/auth_user').to route_to('api/v1/authentication#authenticate_user')
    end
  end
end