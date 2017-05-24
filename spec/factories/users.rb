FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password '12345678'
    password_confirmation '12345678'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    title 'Dr.'
    location 'Taiwan'
    institution 'McKay Hospital'
    date_of_birth { Date.today.to_s }
    phone_number '094521209'

    factory :user_with_work_experiences do
      transient do
        work_experiences_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:work_experience, evaluator.work_experiences_count, user: user)
      end
    end

    factory :user_with_educations do
      transient do
        educations_count 3
      end

      after(:create) do |user, evaluator|
        create_list(:education, evaluator.educations_count, user: user)
      end
    end

    factory :user_with_certificates do
      transient do
        certificates_count 2
      end

      after(:create) do |user, evaluator|
        create_list(:certificate, evaluator.certificates_count, user: user)
      end
    end

  end
end