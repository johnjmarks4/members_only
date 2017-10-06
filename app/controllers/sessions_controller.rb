class SessionsController < ApplicationController
  def new
  end

  def profile
    @user = User.find_by(id: session[:user_id])
    if !@user.nil? && @user.authenticate(session[:password])
      log_in(@user)
      render 'profile'
    end
  end

  def destroy
    log_out
    session.delete(:user_id)
    redirect_to sessions_new_path
  end
end
