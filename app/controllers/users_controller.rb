require 'bcrypt'
require 'digest'

class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to sessions_create_path
    else
      # Would normally be new path, but we aren't actually creating new users
      redirect_to sessions_create_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
