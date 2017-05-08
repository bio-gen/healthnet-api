# Create a test user
user = User.create(
  email: 'test@test.com',
  password: '12345678',
  password_confirmation: '12345678',
  full_name: 'Doctor Mengueche'
  )

user.work_experiences.create(
  title: 'Software Engineer',
  company: 'Google',
  location: 'USA',
  start_date: Date.new,
  current: true,
  description: 'Lalalala'
)
