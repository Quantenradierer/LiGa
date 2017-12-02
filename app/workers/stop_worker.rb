require 'commands'

class StopWorker < ActiveJob::Base
  queue_as :default

  def perform(job)
    job.update!(executed_at: Time.now,
                output: game_command(job.game, 'stop'))
  end
end
