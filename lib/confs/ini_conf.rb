require_relative 'conf'

require 'inifile'

class IniConf < Conf
  def get(key)
    if key.is_a?(Array)
      assert(key.length == 2)
      category = key[0]
      conf = key[1]
    else
      category = :global
      conf = key
    end
    @file[category][conf]
  end

  def set(key, value)
    @file[category][conf] = value
  end

  def load(game)
    Dir.chdir(game.path) do
      @file = IniFile.load(@config.file)
    end
  end

  def save(game)
    @file.save
  end

end
