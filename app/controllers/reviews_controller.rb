class ReviewsController < ApplicationController

    def new 
        @review = Review.new
    end

    def create
        reviewer = User.find(session[:user_id])
        booking = Booking.find(params[:id])
        @review = Review.create(params.require(:booking).permit(:description, :reviewer, :booking))
    end


    
end
