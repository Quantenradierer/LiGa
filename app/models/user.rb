class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :email, presence: true,
            length: { minimum: 5, maximum: 127 },
            uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }

  has_secure_password
end
