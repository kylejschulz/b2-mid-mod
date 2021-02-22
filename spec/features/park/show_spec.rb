require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I visit the park show' do
    it "I see the name and price of admissions for that amusement park" do
      park_1 = Park.create!(name: "Six Flags", price: 80)

      mechanic_1 = Mechanic.create!(name: 'Jim Griffiths', years_experience: 12)
      ride_1 = park_1.rides.create!(name: "Raging Bull", thrill_rating: 4, open: true)
      ride_2 = park_1.rides.create!(name: "Giant Drop", thrill_rating: 6, open: true)
      ride_3 = park_1.rides.create!(name: "Viper", thrill_rating: 9, open: true)
      ride_4 = park_1.rides.create!(name: "Teacup", thrill_rating: 5, open: true)
      mechanic_1.rides << ride_1
      mechanic_1.rides << ride_2
      mechanic_1.rides << ride_3
      mechanic_1.rides << ride_4

      visit "/parks/#{park_1.id}"
      save_and_open_page



      expect(page).to have_content("#{park_1.name}")
      expect(page).to have_content("#{park_1.price}")
      expect(page).to have_content("Teacup")
      expect(page).to have_content("Raging Bull")
      expect(page).to have_content("Giant Drop")
      expect(page).to have_content("Viper")
      expect(page).to have_content("Average Thrill Rating:")
      expect(page).to have_content(6)

      expect(ride_2.name).to appear_before(ride_1.name)
      expect(ride_1.name).to appear_before(ride_4.name)
      expect(ride_4.name).to appear_before(ride_3.name)


    end
  end
end




#
# Extension - Amusement Park Show page
#
# As a visitor,
# When I visit an amusement park’s show page
# I see the name and price of admissions for that amusement park
# And I see the names of all the rides that are at that theme park listed in alphabetical order
# And I see the average thrill rating of this amusement park’s rides
# Ex: Hershey Park
#    Admissions: $50.00
#
#    Rides:
#           1. Lightning Racer
#           2. Storm Runner
#           3. The Great Bear
#    Average Thrill Rating of Rides: 7.8/10
#
# Note: You may have to make new migrations for this story
