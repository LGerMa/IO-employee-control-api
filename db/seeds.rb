# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.find_by(email: 'admin@admin.com').blank?
  User.create!(
    email: 'admin@admin.com',
    password: 'admin123456',
    fullname: 'admin',
    role: 'admin'
  )

  p 'Added user admin'
end

if User.find_by(email: 'user@company.com').blank?
  User.create!(
    email: 'user@company.com',
    password: 'user123456',
    fullname: 'user'
  )

  p 'Added user'
end

(5..10).to_a.sample.times do
  User.create!(
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password,
    fullname: Faker::TvShows::GameOfThrones.character
  )
end

users = User.all

users.each do |user|
  (5..10).to_a.sample.times do
    labor_time = user.labor_times.create!(start_date: Time.now - (10..60).to_a.sample.hours)
    labor_time.update!(end_date: labor_time.start_date + (7..9).to_a.sample.hours)
  end
end
