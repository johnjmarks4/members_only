class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    if !@user.nil? && @user.authenticate(session[:password])
      @current_user = log_in(@user)
      render sessions_create_path
    end
  end

  def delete
  end
end
