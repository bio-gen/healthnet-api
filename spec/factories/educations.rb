FactoryGirl.define do
  factory :education do
    school { Faker::University.name }
    degree { Faker::Educator.course }
    field 'Medicine'
    description 'MyText'
    from_year '1990'
    to_year '1998'

    # Associations
    user
  end
end
