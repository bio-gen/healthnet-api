require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  context 'Strong parameters' do

    let(:attributes) { FactoryGirl.attributes_for(:user).keys }
    let(:params) { { data: { type: 'users', attributes: FactoryGirl.attributes_for(:user) } } }

    describe 'POST create' do
      it { is_expected.to permit(*attributes).for(:create, params: params).on(:data).on(:attributes) }
    end

    describe 'PUT/PATCH update' do
      let(:user) { FactoryGirl.create(:user) }
      before { params[:id] = user.id }

      it { is_expected.to permit(*attributes).for(:update, params: params).on(:data).on(:attributes) }
    end

  end
end
