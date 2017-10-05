class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    if !@user.nil?
      redirect_to sessions_new_path
    end
  end
end
