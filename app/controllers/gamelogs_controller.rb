class GamelogsController < ApplicationController

  def new
    print params
  end

  def show
    game = Game.find(params[:game_id])
    authorize game
    @log_name = params[:id]

    File.open(File.join(game.log_path, @log_name + '.log')) do |handle|
      @log = handle.readlines.join
    end
  end

end
