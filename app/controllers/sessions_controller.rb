class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to welcome_path(user)
        else
            flash.now[:alert] = "Email/Password are invalid"
            render 'new'
        end
    end


    def destroy
        session[:user_id] = nil
        redirect_to grabber_path
    end

end