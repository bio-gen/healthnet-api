FactoryGirl.define do
  factory :work_experience do
    title { Faker::Job.title }
    company { Faker::Company.name }
    location { Faker::Address.country }
    start_year '1995'
    end_year '2000'
    current false
    description 'MyText'

    # Associations
    user
  end
end
