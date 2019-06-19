class UsersController < ApplicationController

    def login
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to welcome_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            render 'new'
        end
    end

    def welcome
        @user = User.find(session[:user_id])
    end

    def my_items
        @user = User.find(session[:user_id])
    end

    def my_bookings
        @bookings = Booking.all.select{ |booking| (booking.user_id == session[:user_id] && !booking.booking_completed)}
    end

    def bookings_history
        @bookings = Booking.all.select{ |booking| (booking.user_id == session[:user_id] && booking.booking_completed)}
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
