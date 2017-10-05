require 'bcrypt'
require 'digest'

class User < ApplicationRecord
  attr_accessor :remember_token
  has_secure_password

  def new_token(user)
    remember_token = SecureRandom.urlsafe_base64
    remember_token = Digest::SHA1.hexdigest(remember_token.to_s)
    user.remember_token = remember_token
  end

  before_create do
    new_token(self)
  end
end
