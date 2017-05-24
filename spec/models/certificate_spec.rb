require 'rails_helper'

RSpec.describe Certificate, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:certificate)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :granted_by }
    it { is_expected.to validate_presence_of :year }
  end

  context 'associations' do
    it { is_expected.to(belong_to(:user)) }
  end
end
