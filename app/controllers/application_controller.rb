class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !current_user.nil?
  end

  def log_in(user)
    session[:user_id] = user.id
    cookies.permanent[:remember_token] = user.new_token(user)
    session[:logged_in] = true
    current_user
  end

  def current_user
    @current_user ||= User.find_by(remember_token: session[:remember_token])
  end

  def log_out
    @current_user = nil
    session[:logged_in] = false
    cookies.delete(:remember_token)
  end
end
