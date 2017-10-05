class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def log_in(user)
    session[:user_id] = user.id
    remember_token = SecureRandom.urlsafe_base64
    remember_token = Digest::SHA1.hexdigest(remember_token.to_s)
    cookies.permanent[:remember_token] = remember_token
  end
end
