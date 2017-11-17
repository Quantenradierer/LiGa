require_relative '../helpers/games_helper'

class GamesController < ApplicationController
  include GamesHelper

  def new
    @game = Game.new
  end

  def index
    @games = Game.all
  end

  def start
    @game = Game.find(params[:id])
    @game.output = game_command(@game, 'start')
    @game.save
    redirect_to @game
  end

  def stop
    @game = Game.find(params[:id])
    @game.output = game_command(@game, 'stop')
    @game.save
    redirect_to @game
  end

  def create
    @game = Game.new(game_params)
    authorize @game

    output = lgms_command(@game.servername)

    @game.update_attributes(output: output, location: regex_game_name(output))
    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
    @log = get_last_log(@game)
  end

  private
  def game_params
    params.require(:game).permit(:title, :servername)
  end

end
