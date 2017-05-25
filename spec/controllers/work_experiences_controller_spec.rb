require 'rails_helper'

RSpec.describe Api::V1::WorkExperiencesController, type: :controller do

  context 'Strong parameters' do
    let(:user) { FactoryGirl.create(:user) }

    let(:attributes) { FactoryGirl.attributes_for(:work_experience).keys }
    let(:params) { { data: { type: 'work_experiences', attributes: FactoryGirl.attributes_for(:work_experience) } } }

    before { params[:user_id] = user.id }

    describe 'POST create' do
      it { is_expected.to permit(*attributes).for(:create, params: params).on(:data).on(:attributes) }
    end

    describe 'PUT/PATCH update' do
      let(:work_experience) { FactoryGirl.create(:work_experience) }
      before { params[:id] = work_experience.id }

      it { is_expected.to permit(*attributes).for(:create, params: params).on(:data).on(:attributes) }
    end
  end

end
