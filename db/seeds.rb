# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!( name: "SteveK",
              email: "a@b.com",
              password: "towson",
              password_confirmation: "towson",
              usertype: 2)
              
99.times do |n|
  name = Faker::Name.name
  email = "fake#{n+1}@towson.edu"
  password = "password"
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end