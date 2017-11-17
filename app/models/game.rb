class Game < ApplicationRecord
  has_many :game_manager_assignments
  has_many :users, through: :game_manager_assignments

  validates :title, presence: true, length: { minimum: 5, maximum: 63 }, uniqueness: true
  validates :servername, presence: true, length: { minimum: 4, maximum: 63 },
            acceptance: { accept: %w(mcserver arkserver)}


end
