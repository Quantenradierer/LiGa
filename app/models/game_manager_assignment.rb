class GameManagerAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def has_right? method
    bits = RIGHTS[method]
    return right && bits
  end
end
