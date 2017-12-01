class AddTripToReviews < ActiveRecord::Migration[5.1]
  def change
  	add_column :reviews, :trip_id, :integer
  end
end
