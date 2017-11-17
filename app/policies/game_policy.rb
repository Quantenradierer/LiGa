class GamePolicy < ApplicationPolicy
  def create?
    user.role? :admin?
  end

  def update?
    user.role? :admin?
  end
end