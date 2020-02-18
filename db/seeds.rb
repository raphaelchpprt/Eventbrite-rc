# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Event.destroy_all

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    email: Faker::Name.first_name.downcase + "@yopmail.com",
    password: "mdpmdp"
  )
end


multiple_of_five = [5, 10, 15, 20, 25, 30, 35, 40]
a=1
20.times do
  Event.create!(
    start_date: Faker::Time.between(from: DateTime.now, to: DateTime.now+30),
    duration: multiple_of_five.sample,
    title: "Fake Event " + a.to_s,
    description: Faker::Lorem.paragraph,
    price: Faker::Number.between(from: 20, to: 1000),
    location: Faker::Address.city,
    admin_id: User.all.sample.id
  )
a+=1
end