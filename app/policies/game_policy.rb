class GamePolicy < ApplicationPolicy
  def create?
    user.role? :admin
  end

  def update?
    user.role? :admin
  end

  def start?
    user.role? :admin
  end

  def stop?
    user.role? :admin
  end

  def index?
    user.role? :admin
  end
end