class Ride < ApplicationRecord
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  belongs_to :park

  def self.alpha_sort
    order(:name)
  end

end
