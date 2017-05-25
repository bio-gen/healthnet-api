require 'rails_helper'

RSpec.describe Api::V1::EducationsController, type: :controller do

  context 'Strong parameters' do
    let(:user) { FactoryGirl.create(:user) }

    let(:attributes) { FactoryGirl.attributes_for(:education).keys }
    let(:params) { { data: { type: 'educations', attributes: FactoryGirl.attributes_for(:education) } } }

    before { params[:user_id] = user.id }

    describe 'POST create' do
      it { is_expected.to permit(*attributes).for(:create, params: params).on(:data).on(:attributes) }
    end

    describe 'PUT/PATCH update' do
      let(:education) { FactoryGirl.create(:education) }
      before { params[:id] = education.id }

      it { is_expected.to permit(*attributes).for(:update, params: params).on(:data).on(:attributes) }
    end

  end
end
