class BookingsController < ApplicationController

    def show
        @booking = Booking.find params[:id]
    end

    def create_booking
        borrower = User.find(session[:user_id])
        item = Item.find params[:item_id]
        booking = Booking.new
        booking.user = borrower
        booking.item = item
        booking.save
        item.available = false
        item.save
        redirect_to my_bookings_path
    end

    def return_item
        booking = Booking.find params[:booking_id]
        item = Item.find params[:item_id]
        item.available = true
        booking.booking_completed = true
        item.save
        booking.save
        redirect_to items_path
    end
end
