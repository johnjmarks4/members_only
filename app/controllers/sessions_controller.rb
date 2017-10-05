class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    if !@user.nil? && @user.authenticate(session[:password])
      log_in(@user)
      redirect_to "application#signin"
    end
  end
end
