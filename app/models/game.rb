class Game < ApplicationRecord
  has_many :game_manager_assignments
  has_many :users, through: :game_manager_assignments
  has_many :gamelogs

  validates :title, presence: true, length: { minimum: 5, maximum: 63 }, uniqueness: true
  validates :gameserver, presence: true, length: { minimum: 4, maximum: 63 },
             acceptance: { accept: %w(mcserver arkserver)}

  def log_path
    File.join(path, 'log', 'console')
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


end
