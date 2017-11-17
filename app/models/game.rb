class Game < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 63 }, uniqueness: true
  validates :servername, presence: true, length: { minimum: 4, maximum: 63 },
            acceptance: { accept: %w(mcserver arkserver)}


end
