# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!( name: "Steve Travel Agent",
              email: "skenne28@students.towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 1)

User.create!( name: "Francesco Travel Agent",
              email: "fbutts1@students.towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 1)
              
User.create!( name: "Rachel Travel Agent",
              email: "rosias1@students.towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 1)
              
User.create!( name: "Deepika Travel Agent",
              email: "gorre.deepika@gmail.com",
              password: "towson",
              password_confirmation: "towson",
              usertype: 1)
              
User.create!( name: "SteveK Admin",
              email: "admin@a.com",
              password: "towson",
              password_confirmation: "towson",
              usertype: 2)
              
User.create!( name: "SteveK Agent",
              email: "travel@agent.com",
              password: "towson",
              password_confirmation: "towson",
              usertype: 1)
              

              
User.create!( name: "SteveK",
              email: "a@b.com",
              password: "towson",
              password_confirmation: "towson",
              usertype: 0)
              
User.create!( name: "Francesco",
              email: "f@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 0)              
              
User.create!( name: "Francesco Agent",
              email: "f_agent@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 1)
              
User.create!( name: "Francesco Admin",
              email: "f_admin@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 2)                      
              
User.create!( name: "Rachel",
              email: "r@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 0)              
              
User.create!( name: "Rachel Agent",
              email: "r_agent@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 1)
              
User.create!( name: "Rachel Admin",
              email: "r_admin@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 2)      
              
User.create!( name: "Deepika",
              email: "d@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 0)              
              
User.create!( name: "Deepika Agent",
              email: "d_agent@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 1)
              
User.create!( name: "Deepika Admin",
              email: "d_admin@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 2)       
              
User.create!( name: "Clint",
              email: "umdmariachi@gmail.com",
              password: "towson",
              password_confirmation: "towson",
              usertype: 0)   
              
15.times do |n|
  name = Faker::Name.name
  email = "fake#{n+1}@towson.edu"
  password = "towson"
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end