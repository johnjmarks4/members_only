class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      #
    end
  end
end
