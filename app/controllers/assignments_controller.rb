class AssignmentsController < ApplicationController
  before_action { authenticate! }

  def new; end

  def create
    assignment = Assignment.new(assignment_params)
    authorize assignment.game, :rights?
    assignment.save
    redirect_to assignment.user
  end

  def update
    assignment = Assignment.find(params[:id])
    game = assignment.game
    user = assignment.user
    RIGHTS.each do |right, flag|
      begin
        authorize game, right
      rescue NotAuthorizedError
        next
      end
      name = right.to_s.chomp('?')
      if params[:assignments][name] == '1'
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
    params.require(:assignments).permit(:user_id, :game_id)
  end
end
