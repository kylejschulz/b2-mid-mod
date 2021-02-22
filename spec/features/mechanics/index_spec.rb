require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a mechanics index page' do
    it "I see a header saying “All Mechanics”" do
      mechanic_1 = Mechanic.create!(name: 'Jim Griffiths', years_experience: 12)
      mechanic_2 = Mechanic.create!(name: 'Levi Reeme', years_experience: 18)

      visit "/mechanics"
      save_and_open_page

      expect(page).to have_content("All Mechanics")
      expect(page).to have_content(15)
      expect(page).to have_content("Levi Reeme")
      expect(page).to have_content(12)
      expect(page).to have_content("Jim Griffiths")
      expect(page).to have_content(18)
    end
  end
end

# As a user,
# When I visit the mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# And I see the average years of experience across all mechanics
