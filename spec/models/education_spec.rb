require 'rails_helper'

RSpec.describe Education, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:education)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :school }
    it { is_expected.to validate_presence_of :degree }
    it { is_expected.to validate_presence_of :field }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :start_year }
  end

  context 'associations' do
    it { is_expected.to(belong_to(:user)) }
  end
end
