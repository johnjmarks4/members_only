require 'bcrypt'
require 'digest'

class User < ApplicationRecord
  attr_accessor :remember_token
  has_secure_password

  before_create do
    remember_token = SecureRandom.urlsafe_base64
    remember_token = Digest::SHA1.hexdigest(remember_token.to_s)
    self.remember_token = remember_token
  end
end
