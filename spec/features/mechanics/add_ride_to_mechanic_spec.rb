require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I visit a mechanics show page' do
    it "I see a form to add a ride to their workload" do
      mechanic_1 = Mechanic.create!(name: 'Jim Griffiths', years_experience: 12)
      ride_1 = Ride.create!(name: "Raging Bull", thrill_rating: 4, open: true)
      ride_2 = Ride.create!(name: "Giant Drop", thrill_rating: 6, open: true)
      ride_3 = Ride.create!(name: "Viper", thrill_rating: 9, open: true)
      ride_4 = Ride.create!(name: "Teacup", thrill_rating: 3, open: true)
      mechanic_1.rides << ride_1
      mechanic_1.rides << ride_2
      mechanic_1.rides << ride_3


      visit "/mechanics/#{mechanic_1.id}"
      save_and_open_page

      expect(page).to have_content("Add a ride to their workload")
      expect(page).to have_button("Add Ride")
      fill_in "ride_id", :with => "#{ride_4.id}"
      click_button("Add Ride")
      expect(current_path).to eq("/mechanics/#{mechanic_1.id}")
      expect(page).to have_content("Teacup")

      expect(page).to have_content("Add a ride to their workload")
      expect(page).to have_button("Add Ride")
      fill_in "ride_id", :with => "#{ride_1.id}"
      click_button("Add Ride")
      expect(current_path).to eq("/mechanics/#{mechanic_1.id}")
      expect(page).to have_content("Raging Bull")

    end
  end
end

# I see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and hit submit
# I’m taken back to that mechanic's show page
# And I see the name of that newly added ride on this mechanics show page
#
# Ex:
# Mechanic: Kara Smith
# Years of Experience: 11
#
# Current rides they’re working on:
# The Frog Hopper
# Fahrenheit
# The Kiss Raise
#
# Add a ride to workload:
# Ride Id: _pretend_this_is_a_textfield_
# Submit
