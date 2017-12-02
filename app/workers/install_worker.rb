require 'commands'

class InstallWorker < ActiveJob::Base
  queue_as :default

  def perform(job)
    output = install_server(job.game, LGSM_PATH)
    job.update!(executed_at: Time.now,
                output: output)
  end
end
