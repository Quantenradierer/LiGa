class GameconfigsController < ApplicationController

  def new
  end

  def edit
    game = Game.find(params[:game_id])
    authorize game
    @config_name = params[:id]

    File.open(File.join(game.serverfiles_path, @config_name)) do |handle|
      @config = handle.readlines.join
    end
  end

  def update
    game = Game.find(params[:game_id])
    authorize game
    @config_name = params[:id]

    config = params[:gameconfig][:config]
    File.open(File.join(game.serverfiles_path, @config_name), 'wb') do |handle|
      handle.write(config)
    end
    redirect_to edit_game_gameconfig_path
  end
end
