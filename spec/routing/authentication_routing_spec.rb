require 'rails_helper'

RSpec.describe Api::V1::AuthenticationController, type: :routing do
  describe 'routing' do
    it ' routes to /auth_user' do
      expect(:post => '/api/v1/auth_user').to route_to('api/v1/authentication#authenticate_user')
    end
  end
end