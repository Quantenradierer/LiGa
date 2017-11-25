class UserPolicy < ApplicationPolicy
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