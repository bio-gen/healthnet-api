require 'rails_helper'

RSpec.describe 'Work Experiences', type: :request do
  let(:user) { FactoryGirl.create(:user_with_work_experiences, id: 1) }

  describe 'GET /v1/users/:id/work_experiences' do
    before { get "/v1/users/#{user.id}/work_experiences", headers: { 'Accept': 'application/vnd' } }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns the user\'s work experiences' do
      expect(json_response[:data].size).to eq(5)
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

  describe 'PUT/PATCH /v1/users/:id/work_experiences/:id' do
    before do
      updated_work = {
        data: {
          type: 'work_experiences',
          attributes: {
            location: 'Japan'
          }
        }
      }

      put "/v1/users/1/work_experiences/#{user.work_experiences.first.id}", params: updated_work.to_json, headers: { 'Accept': 'application/vnd', 'Content-Type': 'application/vnd.api+json' }
    end

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'updates the requested work experience' do
      expect(json_response[:data][:attributes][:location]).to eq('Japan')
    end
  end

  describe 'DELETE /v1/users/:id/work_experiences/:id' do
    before { delete "/v1/users/1/work_experiences/#{user.work_experiences.first.id}", headers: { 'Accept': 'application/vnd' } }

    it 'deletes the requested work experience' do
      expect(response).to have_http_status 204
    end
  end
end