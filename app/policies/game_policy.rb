class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.role? :admin
        scope.all
      else
        Game.left_outer_joins(:game_manager_assignments).where(game_manager_assignments: { user: user })
      end
    end
  end

  def create?
    user.role? :admin or has_right (__method__)

  end

  def edit?
    user.role? :admin or has_right (__method__)
  end

  def update?
    user.role? :admin or has_right (__method__)
  end

  def show?
    user.role? :admin or has_right (__method__)
  end

  def index?
    show?
  end

  def logs?
    user.role? :admin or has_right (__method__)
  end

  def upgrade?
    user.role? :admin or has_right (__method__)
  end

  def upgrade_lgsm?
    user.role? :admin or has_right (__method__)
  end

  def start?
    user.role? :admin or has_right (__method__)
  end

  def stop?
    user.role? :admin or has_right (__method__)
  end

  private
  def has_right method
    GameManagerAssignment.where(user: user, game: record).each do |assignment|
      return true if assignment.has_right?(method)
    end
    false
  end
end
