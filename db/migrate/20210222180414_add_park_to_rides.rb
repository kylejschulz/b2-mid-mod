class AddParkToRides < ActiveRecord::Migration[5.2]
  def change
    add_reference :rides, :park, index: true, foreign_key: true
  end
end
