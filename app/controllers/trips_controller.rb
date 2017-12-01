class TripsController < ApplicationController
	#show page for a single trip
	def show
		@trip = Trip.find(params[:id])
		@reviews = Review.where(:trip_id => @trip.id)
	end

	def show_search_trips
		puts params
		@search_input = params[:searchbarn]
		@results = Trip.where(:start_location => @search_input)
	end

	# push to database or something
	def create
		#puts params
		@new_trip = Trip.new(new_trip_params)
		# ensure that at least one activity is filled
		if @new_trip.morning.blank? && 
			@new_trip.breakfast.blank? &&
			@new_trip.noon.blank? &&
			@new_trip.lunch.blank? &&
			@new_trip.afternoon.blank? &&
			@new_trip.dinner.blank? &&
			@new_trip.evening.blank? &&
			@new_trip.night.blank?

			flash[:error] = 'Your trip must have at least one activity'
			redirect_to new_trip_path
		else
			# continue with rest of saving
			if !@new_trip.morning.blank?
				@start_location = @new_trip.morning
			elsif !@new_trip.breakfast.blank?
				@start_location = @new_trip.breakfast
			elsif !@new_trip.noon.blank?
				@start_location = @new_trip.noon
			elsif !@new_trip.lunch.blank?
				@start_location = @new_trip.lunch
			elsif !@new_trip.afternoon.blank?
				@start_location = @new_trip.afternoon
			elsif !@new_trip.dinner.blank?
				@start_location = @new_trip.dinner
			elsif !@new_trip.evening.blank?	
				@start_location = @new_trip.evening
			elsif !@new_trip.night.blank?	
				@start_location = @new_trip.night
			end

			@new_trip.start_location = @start_location
			@new_trip.user = current_user
			if @new_trip.save
				redirect_to root_path
			else
				flash[:error] = @new_trip.errors.full_messages.to_sentence
				redirect_to new_trip_path
			end
		end
	end

	# route to create trip form
	def new
		@new_trip = Trip.new
	end

	def show_reviews
		puts params
		@trip = Trip.find(params[:id])
		@reviews = Review.where(:trip_id => @trip.id)
	end

	private 
	def new_trip_params
    	params.require(:trip).permit(:name,
    		:morning, :breakfast, :noon, :lunch, :afternoon, :dinner, :evening, :night)

	end

end
