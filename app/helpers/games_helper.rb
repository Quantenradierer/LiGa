require 'pty'

module GamesHelper

  def get_server_name(output)
    output[/.*server as ([^\n]*)/,1]
  end

  def create_server_name
    [*('a'..'z'),*('0'..'9')].shuffle[0,16].join
  end

  def install_server(game, lgsm_path)
    if Dir.exist? game.path
      raise ArgumentError('game path already exist')
    end

    shortname = 'mc'
    manager = game.manager_file

    # TODO: improve this, maybe suggest a directory as optionally parameter for lgsm
    output = ''
    output += %x[ mkdir -p #{game.path} ]
    output += %x[ cp #{lgsm_path} #{manager} ]
    output += %x[ sed -i -e s/shortname\\=\\"core\\"/shortname\\=\\"#{shortname}\\"/g #{manager} ]
    output += %x[ sed -i -e s/gameservername\\=\\"core\\"/gameservername\\=\\"#{game.gameserver}\\"/g #{manager} ]

    output += game_command(game, 'auto-install')

    return output
  end

  def game_command(game, command)
    Dir.chdir(game.path) do
      if File.exist? game.name
        %x[ ./#{game.name} #{command} ]
      else
        raise IOError('server manager does not exist')
      end
    end
  end
end