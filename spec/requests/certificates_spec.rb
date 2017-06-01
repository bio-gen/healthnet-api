require 'rails_helper'

RSpec.describe 'Certificates', type: :request do
  let(:user) { FactoryGirl.create(:user_with_certificates) }

  describe 'GET /v1/users/:user_id/certificates' do
    before { get "/v1/users/#{user.id}/certificates", headers: {'Accept': 'application/vnd'} }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns the user\'s certificates' do
      expect(json_response[:data].size).to eq(2)
    end
  end

  describe 'POST /v1/users/:user_id/certificates' do
    context 'when request is valid' do
      before do
        new_certificate = {
          data: {
            type: 'certificates',
            attributes: {
              title: 'Limb preservation and salvage',
              granted_by: 'The American Board of Multiple Specialties in Podiatry',
              year: '2010'
            }
          }
        }
  
        post "/v1/users/#{user.id}/certificates", params: new_certificate.to_json, headers: { 'Accept': 'application/vnd', 'Content-Type': 'application/vnd.api+json' }
      end
  
      it 'returns HTTP status code 201' do
        expect(response).to have_http_status 201
      end
  
      it 'creates and returns the new certificate' do
        expect(json_response[:data][:attributes][:year]).to eq('2010')
      end
    end
    
    context 'when request is invalid' do
      before do
        new_certificate = {
          data: {
            type: 'certificates',
            attributes: {
              title: '',
              granted_by: 'Harvard',
              year: '2010'
            }
          }
        }
        
        post "/v1/users/#{user.id}/certificates", params: new_certificate.to_json, headers: { 'Accept': 'application/vnd', 'Content-Type': 'application/vnd.api+json' }
      end
      
      it 'returns HTTP status code 422' do
        expect(response).to have_http_status 422
      end
      
      it 'returns JSON API error object' do
        expect(json_response[:errors][0][:source][:pointer]).to eq('/data/attributes/title')
      end
    end
  end

  describe 'PUT/PATCH /v1/users/:user_id/certificates/:id' do
    context 'when request is valid' do
      before do
        updated_certificate = {
          data: {
            type: 'certificates',
            attributes: {
              year: '2000'
            }
          }
        }
  
        put "/v1/users/#{user.id}/certificates/#{user.certificates.first.id}", params: updated_certificate.to_json, headers: { 'Accept': 'application/vnd', 'Content-Type': 'application/vnd.api+json' }
      end
  
      it 'returns HTTP status 200' do
        expect(response).to have_http_status 200
      end
  
      it 'updates the requested certificate' do
        expect(json_response[:data][:attributes][:year]).to eq('2000')
      end
    end
    
    context 'when request is invalid' do
      before do
        updated_certificate = {
          data: {
            type: 'certificates',
            attributes: {
              title: ''
            }
          }
        }
        
       put "/v1/users/#{user.id}/certificates/#{user.certificates.first.id}", params: updated_certificate.to_json, headers: { 'Accept': 'application/vnd', 'Content-Type': 'application/vnd.api+json' }
      end
      
      it 'returns HTTP status 422' do
        expect(response).to have_http_status 422
      end
      
      it 'returns JSON API error object' do
        expect(json_response[:errors][0][:source][:pointer]).to eq('/data/attributes/title')
      end
    end
  end

  describe 'DELETE /v1/users/:user_id/certificates/:id' do
    before { delete "/v1/users/#{user.id}/certificates/#{user.certificates.first.id}", headers: { 'Accept': 'application/vnd' } }

    it 'deletes the requested certificate' do
      expect(response).to have_http_status 204
    end
  end
end