class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@reviews = Review.where(:user_id => current_user.id)
	end

	def show_my_trips
		@trips = Trip.where(:user_id => current_user.id)
	end
end
