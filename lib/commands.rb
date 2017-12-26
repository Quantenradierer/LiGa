
def install_server(game, lgsm_path)
  raise ArgumentError, 'game path already exist' if Dir.exist? game.path

  manager = game.manager_file
  gametype = game.gametype

  # TODO: improve this, maybe suggest a directory as optionally parameter for lgsm
  output = ''
  output += `mkdir -p #{game.path}`
  output += `cp #{lgsm_path} #{manager}`
  output += `sed -i -e s/shortname\\=\\"core\\"/shortname\\=\\"#{gametype.shortname}\\"/g #{manager}`
  output += `sed -i -e s/gameservername\\=\\"core\\"/gameservername\\=\\"#{gametype.name}\\"/g #{manager}`

  output += game_command(game, 'auto-install')
  output
end

def game_command(game, command)
  Dir.chdir(game.path) do
    if File.exist? game.name
      `./#{game.name} #{command}`
    else
      raise IOError, 'server manager does not exist'
    end
  end
end
