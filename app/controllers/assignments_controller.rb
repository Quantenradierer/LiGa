class AssignmentsController < ApplicationController
  before_action { authenticate! }

  def new; end

  def create
    assignment = Assignment.new(assignment_params)
    authorize assignment.game, :give_rights?
    assignment.save
    redirect_to assignment.user
  end

  def update
    assignment = Assignment.find(params[:id])
    game = assignment.game
    user = assignment.user

    params = rights_params
    RIGHTS.each do |right, flag|
      begin
        authorize game, right
      rescue NotAuthorizedError
        next
      end
      name = right.to_s.chomp('?')
      if params[name] == '1'
        assignment.rights |= flag
      else
        assignment.rights ^= assignment.rights & flag
      end
    end
    assignment.save

    redirect_to user
  end

  private

  def assignment_params
    params.require(:assignment).permit(:user_id, :game_id)
  end

  def rights_params
    params.require(:assignment)
  end
end
