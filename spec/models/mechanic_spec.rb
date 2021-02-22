require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many(:mechanic_rides)}
    it { should have_many(:rides).through(:mechanic_rides)}
  end

  it "instance methods" do
    mechanic_1 = Mechanic.create!(name: 'Jim Griffiths', years_experience: 12)
    mechanic_2 = Mechanic.create!(name: 'Levi Reeme', years_experience: 18)

    expect(Mechanic.average_experience).to eq(15)
  end
end
