FactoryBot.define do
  factory :user do
    fullname { Faker::TvShows::GameOfThrones.character }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
  end
end