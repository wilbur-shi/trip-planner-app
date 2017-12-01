class AddStartLocationToTrips < ActiveRecord::Migration[5.1]
  def change
  	add_column :trips, :start_location, :string
  end
end
