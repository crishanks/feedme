class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
      user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to new_feeds_path
    else
      flash[:errors]
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end

end
