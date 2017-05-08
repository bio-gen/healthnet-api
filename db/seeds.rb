# Create a test user
user = User.create(
  email: 'test@test.com',
  password: '12345678',
  password_confirmation: '12345678',
  first_name: 'John',
  last_name: 'Salchichon'
  )

user.work_experiences.create(
  title: 'Software Engineer',
  company: 'Google',
  location: 'USA',
  start_date: Date.today.to_s,
  current: true,
  description: 'Lalalala'
)
