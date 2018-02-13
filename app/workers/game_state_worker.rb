require 'commands'

class GameStateWorker < ActiveJob::Base
  queue_as :default

  def perform
    Game.all.each do |game|
      status = %x[tmux list-sessions 2>&1 | grep -Ec "^#{game.name}:"]
      game.update(status: status)
    end

    #GameStateWorker.set(wait: 1.minute).perform_later
  rescue SQLite3::BusyException

  end
end