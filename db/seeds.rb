# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Create an admin user


20.times do
  puts username = Faker::Internet.username,
  user = User.create!(
    email: "#{username}@yopmail.com",
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph(sentence_count: 2), 
  )
end

puts "User seed réussi!"


# Create an event
5.times do
event = Event.create!(
  start_date: Faker::Time.between(from: Time.now, to: 1.year.from_now),
  duration: rand(1..5) * 5,
  title: Faker::Lorem.characters(number: 10, min_alpha: 4),
  description: Faker::Lorem.paragraph(sentence_count: 2),
  price: rand(1..1000),
  location: Faker::Address.full_address,
  admin_id: rand(1..20))
end

puts "Event seed réussi!"


100.times do
  attendance = Attendance.create!(
    user_id:  rand(1..20),
    event_id: rand(1..5)
  )
end

puts "Attendance seed réussi!"
