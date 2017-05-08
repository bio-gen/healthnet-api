require 'rails_helper'

RSpec.describe 'Work Experiences', type: :request do
  let(:user) { FactoryGirl.create(:user, id: 1) }

  describe 'GET /v1/users/:id/work_experiences' do
    it 'returns the user\'s work experiences' do
      FactoryGirl.create(:work_experience, company: 'Microsoft', user: user)
      FactoryGirl.create(:work_experience, company: 'Airbnb', user: user)

      get "/v1/users/#{user.id}/work_experiences", headers: { 'Accept': 'application/vnd' }

      expect(response).to have_http_status 200

      body = JSON.parse(response.body)

      work_companies = body['data'].map { |work| work['attributes']['company'] }
      expect(work_companies).to match_array(['Microsoft', 'Airbnb'])
    end
  end

  describe 'POST /v1/users/:id/work_experiences' do
    it 'creates and saves a new work experience item' do
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

      expect(response).to have_http_status 201

      body = JSON.parse(response.body)

      work_company = body['data']['attributes']['company']
      expect(work_company).to eq 'Apple'
    end
  end
end