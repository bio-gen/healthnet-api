FactoryGirl.define do
  factory :work_experience do
    title 'Software Engineer'
    company 'Google'
    location 'USA'
    start_date { Faker::Date.backward(50) }
    end_date { Faker::Date.backward(10) }
    current false
    description 'MyText'
    user { create(:user) }
  end
end
