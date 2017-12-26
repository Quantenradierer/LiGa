class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def right?(method)
    bits = RIGHTS[method]
    not (rights & bits).zero?
  end
end
