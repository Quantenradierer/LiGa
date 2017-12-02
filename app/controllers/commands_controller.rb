class CommandsController < ApplicationController

  def show
    @command = CommandJob.find(params[:id])
    authorize @command.game
  end
end
