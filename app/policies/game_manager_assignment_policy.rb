class GameManagerAssignmentPolicy < ApplicationPolicy
  def update?
    user.role? :admin
  end

  def create?
    user.role? :admin
  end
end
