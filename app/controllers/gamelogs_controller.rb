class GamelogsController < ApplicationController

  def new
    print params
  end

  def show
    #params.require(:gamelog).permit(:game_id)
    print params
  end

end
