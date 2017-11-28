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

    @game.output = game_command(@game, 'update')
    @game.save
    redirect_to @game
  end

  def upgrade_lgsm
    @game = authorize Game.find(params[:id])

    @game.output = game_command(@game, 'update-lgsm')
    @game.save
    redirect_to @game
  end

  def start
    @game = authorize Game.find(params[:id])

    @game.output = game_command(@game, 'start')
    @game.save
    redirect_to @game
  end

  def stop
    @game = authorize Game.find(params[:id])

    @game.output = game_command(@game, 'stop')
    @game.save
    redirect_to @game
  end

  def create
    @game = authorize Game.new(game_params)
    @gametypes = Gametype.all

    if not @game.valid?
      return render 'new'
    end

    name = create_server_name
    @game.update_attributes(name: name, path: File.join(GAMES_PATH, name))

    @game.output = install_server(@game, File.join(GAMES_PATH, LGSM_NAME))
    if @game.save
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
    @game = authorize Game.find(params[:id])
    game_command(@game, 'stop')

    command("mv #{@game.path} #{DELETED_PATH}")
    @game.destroy
    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:title, :gametype_id)
  end

end
