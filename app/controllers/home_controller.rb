class HomeController < ApplicationController
	def index
	end
	def sad
		render "home/sad", :layout => false
	end
end
