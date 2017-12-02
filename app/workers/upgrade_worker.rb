require 'commands'

class UpgradeWorker < ActiveJob::Base
  queue_as :default

  def perform(job)
    job.update!(executed_at: Time.now,
                output: game_command(job.game, 'update'))
  end
end
