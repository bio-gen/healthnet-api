class User < ApplicationRecord
  has_secure_password

  validate :email, :presence => true
  validate :password, :presence => true
end
