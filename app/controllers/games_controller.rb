require_relative '../helpers/games_helper'

class GamesController < ApplicationController
  include GamesHelper

  def new
    @game = authorize Game.new
    @gametypes = Gametype.all
  end

  def index
    @games = policy_scope(Game)
  end

  def upgrade
    @game = authorize Game.find(params[:id])
    UpgradeWorker.perform_later(
      CommandJob.create(user_id: current_user.id, game_id: @game.id, worker: UpgradeWorker)
    )
    redirect_to @game
  end

  def upgrade_lgsm
    @game = authorize Game.find(params[:id])
    UpgradeLgsmWorker.perform_later(
      CommandJob.create(user_id: current_user.id, game_id: @game.id, worker: UpgradeLgsmWorker)
    )
    redirect_to @game
  end

  def start
    @game = authorize Game.find(params[:id])
    StartWorker.perform_later(
      CommandJob.create(user_id: current_user.id, game_id: @game.id, worker: StartWorker)
    )
    redirect_to @game
  end

  def stop
    @game = authorize Game.find(params[:id])
    StopWorker.perform_later(
      CommandJob.create(user_id: current_user.id, game_id: @game.id, worker: StopWorker)
    )
    redirect_to @game
  end

  def create
    @game = authorize Game.new(game_params)
    @gametypes = Gametype.all

    name = create_server_name
    @game.update_attributes(name: name, path: File.join(GAMES_PATH, name))

    if @game.save
      InstallWorker.perform_later(
        CommandJob.create(user_id: current_user.id, game_id: @game.id, worker: InstallWorker)
      )
      redirect_to @game
    else
      render 'new'
    end
  end

  def show
    @game = authorize Game.find(params[:id])
    @output ||= @game.output
  end

  def destroy
    game = authorize Game.find(params[:id])
    DeleteWorker.perform_later(
        CommandJob.create(user_id: current_user.id, game_id: game.id, worker: DeleteWorker)
    )
    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:title, :gametype_id)
  end
end
