class GameManagerAssignmentsController < ApplicationController
  before_action { authenticate! }

  def new; end

  def create
    gm_assignment = authorize GameManagerAssignment.new(gm_assignment_params)
    gm_assignment.save
    redirect_to gm_assignment.user
  end

  def update
    gm_assignment = GameManagerAssignment.find(params[:id])
    game = gm_assignment.game
    user = gm_assignment.user
    RIGHTS.each do |right, flag|
      begin
        authorize game, right
      rescue NotAuthorizedError
        next
      end
      name = right.to_s.chomp('?')
      if params[:game_manager_assignments][name] == '1'
        gm_assignment.rights |= flag
      else
        gm_assignment.rights ^= gm_assignment.rights & flag
      end
    end
    gm_assignment.save

    redirect_to user
  end

  private
  def gm_assignment_params
    params.require(:game_manager_assignments).permit(:user_id, :game_id)
  end
end
