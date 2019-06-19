class ReviewsController < ApplicationController

    def new 
        @review = Review.new
    end

    def create
        reviewer = User.find(session[:user_id])
        booking = Booking.find params[:review][:booking_id]
        @review = Review.create(params.require(:review).permit(:description, :booking_id, :user_id))
        # @review.user = reviewer
        # @review.booking_id = booking.id
        # @review.save
        redirect_to review_path(@review)
    end

    def show
        @review = Review.find params[:id]
    end


    
end
