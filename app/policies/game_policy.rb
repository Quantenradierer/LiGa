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
    user.role? :admin
  end

  def index?
    show?
  end

  def show?
    has_right (__method__)
  end

  def edit?
    has_right (__method__)
  end

  def update?
    has_right (__method__)
  end

  def upgrade?
    has_right (__method__)
  end

  def upgrade_lgsm?
    has_right (__method__)
  end

  def start?
    has_right (__method__)
  end

  def stop?
    has_right (__method__)
  end

  def console?
    has_right (__method__)
  end

  def backup?
    has_right (__method__)
  end

  def logs?
    has_right (__method__)
  end

  def edit_config_low?
    has_right (__method__)
  end

  def edit_config_medium?
    has_right (__method__)
  end

  def edit_config_high?
    has_right (__method__)
  end

  private
  def has_right method
    @gm_assignment ||= GameManagerAssignment.where(user: user, game: record)
    @gm_assignment.each do |assignment|
      return true if assignment.has_right?(method)
    end
    user.role? :admin
  end
end
