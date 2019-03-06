class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(name: params[:name])
        if user
            session[:name] = params[:name]
            redirect_to feeds_path
        else
            flash[:notice] = "Invalid Login"
            redirect_to login_path
        end
      
    end

    def destroy
      session.clear
      redirect_to login_path
    end
end