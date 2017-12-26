require 'inifile'

class IniConf < FileConf
  def initialize(path)
    super(path)
    @file = IniFile.load(path)
  end

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
end