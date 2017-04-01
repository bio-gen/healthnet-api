# Create a test user
User.create(email: 'test@test.com',
    password: '12345678',
    password_confirmation: '12345678',
    professional_experience: Faker::Lorem.paragraph(5),
    educational_background: Faker::Lorem.paragraph(5)
    )