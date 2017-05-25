require 'rails_helper'

RSpec.describe Api::V1::CertificatesController, type: :controller do

  context 'Strong parameters' do
    let(:user) { FactoryGirl.create(:user) }

    let(:attributes) { FactoryGirl.attributes_for(:certificate).keys }
    let(:params) { { data: { type: 'certificates', attributes: FactoryGirl.attributes_for(:certificate) } } }

    before { params[:user_id] = user.id }

    describe 'POST create' do
      it { is_expected.to permit(*attributes).for(:create, params: params).on(:data).on(:attributes) }
    end

    describe 'PUT/PATCH update' do
      let(:certificate) { FactoryGirl.create(:certificate) }
      before { params[:id] = certificate.id }

      it { is_expected.to permit(*attributes).for(:update, params: params).on(:data).on(:attributes) }
    end
  end

end
