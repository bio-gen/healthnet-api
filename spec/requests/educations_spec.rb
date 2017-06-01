require 'rails_helper'

RSpec.describe 'Educations', type: :request do
  let(:user) { FactoryGirl.create(:user_with_educations, id: 1) }

  describe 'GET /v1/users/:user_id/educations' do
    before { get "/v1/users/#{user.id}/educations", headers: { 'Accept': 'application/vnd'} }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns the user\'s educations' do
      expect(json_response[:data].size).to eq(3)
    end
  end

  describe 'POST /v1/users/:user_id/educations' do
    context 'when request is valid' do
      before do
        new_education = {
          data: {
            type: 'educations',
            attributes: {
              school: 'UNITEC',
              degree: 'Ing. Sistemas',
              field: 'Computer Science',
              description: 'Blah blah blah',
              start_year: '2008',
              end_year: '2013'
            }
          }
        }
  
        post "/v1/users/#{user.id}/educations", params: new_education.to_json, headers: { 'Accept': 'application/vnd', 'Content-Type': 'application/vnd.api+json' }
      end
  
      it 'returns HTTP status code 201' do
        expect(response).to have_http_status 201
      end
  
      it 'creates and returns the new education item' do
        expect(json_response[:data][:attributes][:school]).to eq('UNITEC')
      end
    end
    
    context 'when request is invalid' do
      before do
        new_education = {
          data: {
            type: 'educations',
            attributes: {
              school: '',
              degree: 'Ing. Sistemas',
              field: 'Computer Science',
              description: 'Blah blah blah',
              start_year: '2008',
              end_year: '2013'
            }
          }
        }
  
        post "/v1/users/#{user.id}/educations", params: new_education.to_json, headers: { 'Accept': 'application/vnd', 'Content-Type': 'application/vnd.api+json' }
      end
  
      it 'returns HTTP status code 422' do
        expect(response).to have_http_status 422
      end
  
      it 'returns a JSON API error object' do
        expect(json_response[:errors][0][:source][:pointer]).to eq('/data/attributes/school')
      end      
    end
  end

  describe 'PUT/PATCH /v1/users/:user_id/educations/:id' do
    context 'when request is valid' do
      before do
        updated_education = {
          data: {
            type: 'educations',
            attributes: {
              school: 'UNAH'
            }
          }
        }
  
        put "/v1/users/#{user.id}/educations/#{user.educations.first.id}", params: updated_education.to_json, headers: { 'Accept': 'application/vnd', 'Content-Type': 'application/vnd.api+json' }
      end
  
      it 'returns HTTP status 200' do
        expect(response).to have_http_status 200
      end
  
      it 'updates the requested education' do
        expect(json_response[:data][:attributes][:school]).to eq('UNAH')
      end
    end
    
    context 'when request is invalid' do
      before do
        updated_education = {
          data: {
            type: 'educations',
            attributes: {
              school: ''
            }
          }
        }
  
        put "/v1/users/#{user.id}/educations/#{user.educations.first.id}", params: updated_education.to_json, headers: { 'Accept': 'application/vnd', 'Content-Type': 'application/vnd.api+json' }
      end
  
      it 'returns HTTP status 422' do
        expect(response).to have_http_status 422
      end
  
      it 'returns a JSON API error object' do
        expect(json_response[:errors][0][:source][:pointer]).to eq('/data/attributes/school')
      end      
    end
  end

  describe 'DELETE /v1/users/:user_id/educations/:id' do
    before { delete "/v1/users/#{user.id}/educations/#{user.educations.first.id}", headers: { 'Accept': 'application/vnd' } }

    it 'deletes the requested education' do
      expect(response).to have_http_status 204
    end
  end

end