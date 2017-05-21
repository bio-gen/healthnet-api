require 'rails_helper'

RSpec.describe WorkExperience, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:work_experience)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :company }
    it { is_expected.to validate_presence_of :location }
    it { is_expected.to validate_presence_of :start_year }
    it { is_expected.to validate_presence_of :description }
  end
end
