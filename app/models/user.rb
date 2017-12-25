class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :email,
            presence: true,
            length: { minimum: 5, maximum: 127 },
            uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }

  has_many :assignments
  has_many :games, through: :assignments

  has_secure_password

  def is_admin?
    email == 'admin'
  end

  def authenticated
    true
  end

  def to_s
    email
  end
end
