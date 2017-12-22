class CommandsController < ApplicationController
  before_action { authenticate! }

  def show
    @command = CommandJob.find(params[:id])
    authorize @command.game
  end
end
