class ReviewsController < ApplicationController

    def new 
        @review = Review.new
    end

    def create
        @review = Review.create(params.require(:review).permit(:description, :booking_id, :user_id))
        redirect_to review_path(@review)
    end

    def show
        @review = Review.find params[:id]
    end


    
end
