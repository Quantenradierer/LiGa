class GameManagerAssignmentsController < ApplicationController
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
end
