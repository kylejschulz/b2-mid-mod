require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a mechanics show page' do
    it "I see their name, years of experience, and the names of all rides they’re working on" do
      mechanic_1 = Mechanic.create!(name: 'Jim Griffiths', years_experience: 12)
      mechanic_2 = Mechanic.create!(name: 'Levi Reeme', years_experience: 18)
      ride_1 = Ride.create!(name: "Raging Bull", thrill_rating: 4, open: true)
      ride_2 = Ride.create!(name: "Giant Drop", thrill_rating: 6, open: true)
      ride_3 = Ride.create!(name: "Viper", thrill_rating: 9, open: true)
      ride_4 = Ride.create!(name: "Teacup", thrill_rating: 3, open: false)
      mechanic_1.rides << ride_1
      mechanic_1.rides << ride_2
      mechanic_1.rides << ride_3
      mechanic_1.rides << ride_4

      visit "/mechanics/#{mechanic_1.id}"
      save_and_open_page

      expect(page).to have_content("Jim Griffiths")
      expect(page).to have_content(12)
      expect(page).to have_content("Raging Bull")
      expect(page).to have_content("Giant Drop")
      expect(page).to have_no_content("Teacup")
      expect(ride_3.name).to appear_before(ride_2.name)
      expect(ride_2.name).to appear_before(ride_1.name)

    end
  end
end
