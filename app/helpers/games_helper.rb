require 'pty'

LGMS_PATH = File.join('/', 'home', 'quantenradierer', 'RubymineProjects', 'teslacoil', 'LinuxGSM')
LOG_PATH = File.join(LGMS_PATH, 'log', 'console')
LGMS_NAME = './linuxgsm.sh'

module GamesHelper
  def regex_game_name(output)
    output[/.*server as ([^\n]*)/,1]
  end

  def lgms_command(parameter)
    Dir.chdir(LGMS_PATH) do
      %x[ #{LGMS_NAME} #{parameter} ]
    end
  end

  def game_command(game, command)
    Dir.chdir(LGMS_PATH) do
      if File.exist? game.location
        %x[ ./#{game.location} #{command} ]
      end
    end
  end

  def get_last_log(game)
    console_log = File.join(LOG_PATH, game.location) + '-console.log'
    if File.exist? console_log
      file = File.open(console_log, 'rb')
      return file.read
    end
    return ''
  end

  def all_logs(game)
    Dir[File.join(LOG_PATH, game.location) + '*.log']

  end
end