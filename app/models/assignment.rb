class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def has_right?(method)
    bits = RIGHTS[method]
    not (rights & bits).zero?
  end
end
