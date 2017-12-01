class HomeController < ApplicationController
	def index
		@trips = Trip.all
	end
	def sad
		render "home/sad", :layout => false
	end

end
