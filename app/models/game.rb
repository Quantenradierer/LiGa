class Game < ApplicationRecord
  validates :title, presence: true,
            length: { minimum: 5 },
            uniqueness: true
  validates :servername, presence: true,
            acceptance: { accept: %w(mcserver arkserver)}


end
