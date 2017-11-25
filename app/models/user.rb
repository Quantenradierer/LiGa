class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :email, presence: true,
            length: { minimum: 5, maximum: 127 },
            uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }

  has_many :assignments
  has_many :roles, through: :assignments

  has_many :game_manager_assignments
  has_many :games, through: :game_manager_assignments

  has_secure_password

  def role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end
end
