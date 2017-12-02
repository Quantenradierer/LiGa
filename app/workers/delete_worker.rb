require 'commands'

class DeleteWorker < ActiveJob::Base
  queue_as :default

  def perform(job)
    output = game_command(job.game, 'stop')
    output += %x[mv #{job.game.path} #{DELETED_PATH}]
    job.update!(output: output, executed_at: Time.now)

    job.game.destroy
  end
end
