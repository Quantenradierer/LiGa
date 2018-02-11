class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_admin?
        scope.all
      else
        user.games
      end
    end
  end

  def create?
    user.is_admin?
  end

  def index?
    show?
  end

  def show?
    right? __method__
  end

  def destroy?
    right? __method__
  end

  def edit?
    right? __method__
  end

  def update?
    right? __method__
  end

  def upgrade?
    right? __method__
  end

  def upgrade_lgsm?
    right? __method__
  end

  def start?
    right? __method__
  end

  def stop?
    right? __method__
  end

  def console?
    right? __method__
  end

  def backup?
    right? __method__
  end

  def logs?
    right? __method__
  end

  def edit_config_low?
    right? __method__
  end

  def edit_config_medium?
    right? __method__
  end

  def edit_config_high?
    right? __method__
  end

  def give_rights?
    right? __method__
  end

  private
  def right?(method)
    @assignment ||= Assignment.where(user: user, game: record)
    @assignment.each do |assignment|
      return true if assignment.right?(method)
    end
    user.is_admin?
  end
end
