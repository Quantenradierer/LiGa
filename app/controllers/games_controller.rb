require_relative '../helpers/games_helper'

class GamesController < ApplicationController
  include GamesHelper

  def new
    @game = Game.new
    @gametypes = Gametype.all
  end

  def index
    games = Game.all
    @games = games.select do |elem|
      authorize elem
    end
  end

  def upgrade
    @game = Game.find(params[:id])
    authorize @game

    @game.output = game_command(@game, 'update')
    @game.save
    redirect_to @game
  end

  def upgrade_lgsm
    @game = Game.find(params[:id])
    authorize @game

    @game.output = game_command(@game, 'update-lgsm')
    @game.save
    redirect_to @game
  end

  def start
    @game = Game.find(params[:id])
    authorize @game

    @game.output = game_command(@game, 'start')
    @game.save
    redirect_to @game
  end

  def stop
    @game = Game.find(params[:id])
    authorize @game

    @game.output = game_command(@game, 'stop')
    @game.save
    redirect_to @game
  end

  def create
    new
    @game = Game.new(game_params)
    authorize @game

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
    @game = Game.find(params[:id])
    authorize @game

    @output ||= @game.output
  end

  private
  def game_params
    params.require(:game).permit(:title, :gametype_id)
  end

end
