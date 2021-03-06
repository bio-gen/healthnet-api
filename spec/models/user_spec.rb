require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_confirmation_of :password }
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
  end

  context 'associations' do
    it { is_expected.to have_many(:work_experiences).dependent(:destroy) }
    it { is_expected.to have_many(:educations).dependent(:destroy) }
    it { is_expected.to have_many(:certificates).dependent(:destroy) }
  end
end