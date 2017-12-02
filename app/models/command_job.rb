class CommandJob < ApplicationRecord

  def game
    Game.find( game_id)
  end

  def user
    User.find( id=user_id)
  end
end
