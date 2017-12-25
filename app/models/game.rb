class Game < ApplicationRecord
  has_many :assignments
  has_many :users, through: :assignments
  has_many :gamelogs

  validates :title, presence: true, length: { minimum: 5, maximum: 63 }, uniqueness: true
  validates :gametype_id, presence: true

  def gametype
    Gametype.find(index=gametype_id)
  end

  def log_path
    File.join(path, 'log', 'console')
  end

  def serverfiles_path
    File.join(path, 'serverfiles')
  end

  def config_file
    File.join(path, 'lgsm', 'config-lgsm', gameserver, name + '.cfg')
  end

  def manager_file
    File.join(path, name)
  end

  def last_logs
    console_log = File.join(log_path, name) + '-console.log'
    if File.exist? console_log
      file = File.open(console_log, 'rb')
      return file.read
    end
    return ''
  end

  def available_logs
    return Dir[File.join(log_path, name) + '*.log']
  end

  def available_configs
    Gametype.find(index=gametype_id).configs.split
  end

  def commands
    CommandJob.where(game_id: id).order(created_at: :desc)
  end
end
