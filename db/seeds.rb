# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.create(
  name: 'admin',
  email: 'admin@admin.com',
  password: 'spacejams',
  role: 'admin',
  id: 11
  )

10.times do
  User.create(
    name: Faker::Superhero.name,
    email: Faker::Internet.email,
    password: "password",
    profile_picture: File.open(File.join(Rails.root, 'capybara with attitude 2.jpg')),
    role: 'member'
    )
end

10.times do
  Devtool.create(
  title: "#{Faker::App.name} #{Faker::App.version}",
  github_link: Faker::Internet.domain_name,
  body: "This is a simple development tool to #{Faker::Hacker.say_something_smart}",
  user_id: rand(10)
  )
end

40.times do
  Review.create(
    title: "#{Faker::Hacker.verb} #{Faker::Hacker.ingverb} #{Faker::Hacker.verb}",
    body: Faker::Hipster.paragraph,
    rating: rand(5),
    user_id: rand(10),
    devtool_id: rand(10)
  )
end
