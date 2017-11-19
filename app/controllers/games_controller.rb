require_relative '../helpers/games_helper'

class GamesController < ApplicationController
  include GamesHelper

  def new
    @game = Game.new
  end

  def index
    games = Game.all
    @games = games.select do |elem|
      authorize elem
    end
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
    @game = Game.new(game_params)
    authorize @game

    if not @game.valid?
      return render 'new'
    end

    games_path = '/home/quantenradierer/RubymineProjects/teslacoil/LinuxGSM'
    lgsm_name = 'linuxgsm.sh'
    name = create_server_name

    @game.update_attributes(name: name, path: File.join(games_path, name))

    @game.output = install_server(@game, File.join(games_path, lgsm_name))
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
    params.require(:game).permit(:title, :gameserver)
  end

end
