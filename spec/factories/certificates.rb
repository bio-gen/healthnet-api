FactoryGirl.define do
  factory :certificate do
    title 'Limb preservation and salvage'
    granted_by 'The American Board of Multiple Specialties in Podiatry'
    year '2010'

    # Associations
    user
  end
end
