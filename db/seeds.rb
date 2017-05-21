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
  start_year: Date.today.year.to_s,
  current: true,
  description: 'Lalalala'
  )

user.educations.create(
  school: 'Harvard University',
  degree: 'General Surgeon',
  field: 'Medicine',
  description: 'Lalala',
  start_year: '1990',
  end_year: '2000',
  current: false
  )
