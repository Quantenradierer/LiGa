require_relative '../../lib/confs/configurator'

class GameconfigsController < ApplicationController
  before_action { authenticate! }

  def edit
    game = authorize Game.find(params[:game_id])
    @conf = Configurator(Config.find(params[:id]))
    @conf.load(game)
  end

  def update
    game = authorize Game.find(params[:game_id])
    @conf = Configurator(Config.find(params[:id]))
    @conf.load(game)
    config = params[:gameconfig][:config]
    @conf.set('', config)
    @conf.save(game)
    redirect_to edit_game_gameconfig_path
  end
end
