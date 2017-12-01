class RemoveAuthorFromTrips < ActiveRecord::Migration[5.1]
  def change
  	remove_column :trips, :author
  end
end
