FactoryGirl.define do
  factory :education do
    school { Faker::University.name }
    degree { Faker::Educator.course }
    field 'Medicine'
    description 'MyText'
    start_year '1990'
    end_year '1998'
    current false

    # Associations
    user
  end
end
