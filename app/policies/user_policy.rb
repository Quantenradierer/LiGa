class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_admin?
        scope.all
      else
        scope.none
      end
    end
  end

  def create?
    user.is_admin?
  end

  def update?
    user.is_admin?
  end

  def show?
    user.is_admin?
  end

  def index?
    user.is_admin? or user == record
  end

  def change_password?
    user == record
  end
end