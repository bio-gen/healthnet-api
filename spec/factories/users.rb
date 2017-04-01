FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password '12345678'
    password_confirmation '12345678'
    professional_experience { Faker::Lorem.paragraph(5) }
    educational_background { Faker::Lorem.paragraph(5) }
  end
end
