class CommandJob < ApplicationRecord
  belong_to :user
  belongs_to :game
end
