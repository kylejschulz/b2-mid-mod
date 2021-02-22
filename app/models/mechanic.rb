class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_experience
    average(:years_experience).round
  end

  def sort_open_thrill
    rides.order(thrill_rating: :desc).where(open: :true)
  end


end
