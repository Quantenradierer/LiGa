
def install_server(game, lgsm_path)
  if Dir.exist? game.path
    raise ArgumentError.new('game path already exist')
  end

  manager = game.manager_file
  gametype = game.gametype

  # TODO: improve this, maybe suggest a directory as optionally parameter for lgsm
  output = ''
  output += %x[ mkdir -p #{game.path} ]
  output += %x[ cp #{lgsm_path} #{manager} ]
  output += %x[ sed -i -e s/shortname\\=\\"core\\"/shortname\\=\\"#{gametype.shortname}\\"/g #{manager} ]
  output += %x[ sed -i -e s/gameservername\\=\\"core\\"/gameservername\\=\\"#{gametype.name}\\"/g #{manager} ]

  output += game_command(game, 'auto-install')
  output
end

def game_command(game, command)
  Dir.chdir(game.path) do
    if File.exist? game.name
      %x[ ./#{game.name} #{command} ]
    else
      raise IOError.new('server manager does not exist')
    end
  end
end