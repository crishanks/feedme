class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = params[:user_id]
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