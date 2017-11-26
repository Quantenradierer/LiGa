class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.role? :admin
        scope.all
      else
        scope.none
      end
    end
  end

  def create?
    user.role? :admin
  end

  def update?
    user.role? :admin
  end

  def show?
    user.role? :admin
  end

  def index?
    user.role? :admin or user == record
  end
end