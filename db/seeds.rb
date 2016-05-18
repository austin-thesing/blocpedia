# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'faker' this caused an error
10.times do
  User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  user_name: Faker::Internet.user_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password(10, 20, true, true)
  )
end

@users = User.all

50.times do
  Wiki.create!(
  title: Faker::Hipster.sentence(3, false, 4),
  body: Faker::Hipster.paragraph(2),
  user: @users.sample
  )
end

puts "Created & Seeded #{User.count} Users to the database."
puts "Created & Seeded #{Wiki.count} Wikis to the database."
