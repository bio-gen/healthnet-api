FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password '12345678'
    password_confirmation '12345678'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    factory :user_with_work_experiences do
      transient do
        work_experiences_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:work_experience, evaluator.work_experiences_count, user: user)
      end
    end

  end
end