
ROOT_PATH = File.expand_path('../lgsm')
GAMES_PATH = File.join(ROOT_PATH, 'games')
BACKUP_PATH = File.join(ROOT_PATH, 'backup')
DELETED_PATH = File.join(ROOT_PATH, 'deleted')
LGSM_PATH = File.join(ROOT_PATH, 'linuxgsm.sh')

LGSM_URL = 'https://raw.githubusercontent.com/GameServerManagers/LinuxGSM/master/linuxgsm.sh'.freeze

`mkdir -p #{GAMES_PATH}`
`mkdir -p #{BACKUP_PATH}`
`mkdir -p #{DELETED_PATH}`

Dir.chdir ROOT_PATH do
  unless File.exist? LGSM_PATH
    `wget #{LGSM_URL} #{LGSM_PATH}`
    `chmod +x #{LGSM_PATH}`
  end
end
