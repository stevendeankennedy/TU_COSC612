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
              usertype: 1,
              active: true,
              private: false)

User.create!( name: "Francesco Travel Agent",
              email: "fbutts1@students.towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 1,
              active: true,
              private: false)
              
User.create!( name: "Rachel Travel Agent",
              email: "rosias1@students.towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 1,
              active: true,
              private: false)
              
User.create!( name: "Deepika Travel Agent",
              email: "gorre.deepika@gmail.com",
              password: "towson",
              password_confirmation: "towson",
              usertype: 1,
              active: true,
              private: false)
              
User.create!( name: "Doug E. Doug",
              email: "admin@a.com",
              password: "password",
              password_confirmation: "password",
              usertype: 0,
              active: true,
              private: false)
              
User.create!( name: "SteveK Admin",
              email: "admin@a.com",
              password: "towson",
              password_confirmation: "towson",
              usertype: 2,
              active: true,
              private: false)
              
User.create!( name: "A Travel Agent",
              email: "travel@agent.com",
              password: "towson",
              password_confirmation: "towson",
              usertype: 1,
              active: true,
              private: false)
              

              
User.create!( name: "SteveK",
              email: "a@b.com",
              password: "towson",
              password_confirmation: "towson",
              usertype: 0,
              active: true,
              private: false)
              
User.create!( name: "Francesco",
              email: "f@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 0,
              active: true,
              private: false)              
              
User.create!( name: "Francesco Agent",
              email: "f_agent@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 1,
              active: true,
              private: false)
              
User.create!( name: "Francesco Admin",
              email: "f_admin@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 2,
              active: true,
              private: false)                      
              
User.create!( name: "Rachel",
              email: "r@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 0,
              active: true,
              private: false)              
              
User.create!( name: "Rachel Agent",
              email: "r_agent@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 1,
              active: true,
              private: false)
              
User.create!( name: "Rachel Admin",
              email: "r_admin@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 2,
              active: true,
              private: false)      
              
User.create!( name: "Deepika",
              email: "d@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 0,
              active: true,
              private: false)              
              
User.create!( name: "Deepika Agent",
              email: "d_agent@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 1,
              active: true,
              private: false)
              
User.create!( name: "Deepika Admin",
              email: "d_admin@towson.edu",
              password: "towson",
              password_confirmation: "towson",
              usertype: 2,
              active: true,
              private: false)       
              
User.create!( name: "Clint",
              email: "umdmariachi@gmail.com",
              password: "towson",
              password_confirmation: "towson",
              usertype: 0,
              active: true,
              private: false)   
              
TravelPackage.create!( 
  name: "Mountain Biking",
  price: 500,
  location: "Penn Hills",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed varius lacus euismod erat consequat, id lacinia magna vehicula. ",
  flight_num: "Lambda 300",
  flight_depart: "June 1 at 10:00am",
  flight_arrive: "June 1 at 5:00pm",
  user_id: 2,
  tags: "mountain biking bike outdoors exciting",
  return_num: "Lambda 210",
  return_depart: "June 7 at 4:00pm",
  return_arrive: "June 7 at 11:11pm"
)
end