class AddSomethingToTrips < ActiveRecord::Migration[5.1]
  def change
  	add_column :trips, :morning, :string
  	add_column :trips, :breakfast, :string
   	add_column :trips, :noon, :string
  	add_column :trips, :lunch, :string
   	add_column :trips, :afternoon, :string
  	add_column :trips, :dinner, :string
  	add_column :trips, :evening, :string
  	add_column :trips, :night, :string
  end
end
