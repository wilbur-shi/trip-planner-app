class ReviewsController < ApplicationController

	#only show reviews pertaining to a trip passed into params
	def index
	end

	#show review for a single trip?
	def show
		#no need b/c we just show all at once
	end

	# push to database or something
	def create
		@review = Review.new(review_params)
		# ensure that there is a description
		if @review.description.blank?
			flash[:error] = 'Your review must have a description!'
			redirect_to new_review_path
		else
			# continue with rest of saving
			@review.user = current_user #.id?
			if @review.save
				redirect_to trip_path(id: @review.trip.id)
			else
				flash[:error] = @review.errors.full_messages.to_sentence
				redirect_to new_review_path
			end
		end
	end

	# route to create review form
	def new
		@review = Review.new
		@trip_id = params[:trip_id]
		# @review.trip_id = @trip_id
	end

	private 
	def review_params
    	params.require(:review).permit(:title, :rating, :description, :trip_id)
	end
end
