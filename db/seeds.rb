# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mechanic_1 = Mechanic.create!(name: 'Jim Griffiths', years_experience: 12)
mechanic_2 = Mechanic.create!(name: 'Levi Reeme', years_experience: 18)
mechanic_2 = Mechanic.create!(name: 'Amina Ameur', years_experience: 20)

ride_1 = Ride.create!(name: "Raging Bull", thrill_rating: 4, open: true)
ride_2 = Ride.create!(name: "Giant Drop", thrill_rating: 6, open: true)
ride_3 = Ride.create!(name: "Viper", thrill_rating: 9, open: true)
ride_4 = Ride.create!(name: "Teacup", thrill_rating: 3, open: true)
