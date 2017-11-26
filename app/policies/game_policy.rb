class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.role? :admin
        scope.all
      else
        GameManagerAssignment.where(user=user)
      end
    end
  end

  def create?
    user.role? :admin
  end

  def edit?
    user.role? :admin
  end

  def update?
    user.role? :admin
  end

  def show?
    user.role? :admin
  end

  def index?
    user.role? :admin
  end

  def upgrade?
    user.role? :admin
  end

  def upgrade_lgsm?
    user.role? :admin
  end

  def start?
    user.role? :admin
  end

  def stop?
    user.role? :admin
  end
end
