require_relative 'file_conf'
require_relative 'ini_conf'

def Configurator(config)
  available = {
    'FileConf' => FileConf,
    'IniConf' => IniConf
  }

  available[config.configurator].new(config)
end
