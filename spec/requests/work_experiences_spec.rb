require 'rails_helper'

RSpec.describe 'Work Experiences', type: :request do
  let(:user) { FactoryGirl.create(:user, id: 1) }

  describe 'GET /v1/users/:id/work_experiences' do
    before do
      FactoryGirl.create(:work_experience, company: 'Microsoft', user: user)
      FactoryGirl.create(:work_experience, company: 'Airbnb', user: user)

      get "/v1/users/#{user.id}/work_experiences", headers: { 'Accept': 'application/vnd' }
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns the user\'s work experiences' do
      work_companies = json_response[:data].map { |work| work[:attributes][:company] }
      expect(work_companies).to match_array(['Microsoft', 'Airbnb'])
    end
  end

  describe 'POST /v1/users/:id/work_experiences' do
    before do
      new_work = {
        data: {
          type: 'work_experiences',
          attributes: {
            title: 'Software Engineer',
            company: 'Apple',
            location: 'USA',
            start_date: '2017-05-08',
            current: true,
            description: 'Lalalalalala'
          }
        }
      }

      post "/v1/users/#{user.id}/work_experiences", params: new_work.to_json, headers: { 'Accept': 'application/vnd', 'Content-Type': 'application/vnd.api+json' }
    end

    it 'returns HTTP status code 201' do
      expect(response).to have_http_status 201
    end

    it 'creates and returns a new work experience item' do
      expect(json_response[:data][:attributes][:company]).to eq('Apple')
    end
  end
end