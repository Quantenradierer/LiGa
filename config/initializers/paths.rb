
ROOT_PATH = File.expand_path('../LinuxGSM')
GAMES_PATH = File.join(ROOT_PATH, 'Games')
BACKUP_PATH = File.join(ROOT_PATH, 'Backup')
DELETED_PATH = File.join(ROOT_PATH, 'Deleted')
LGSM_PATH = File.join(ROOT_PATH, 'linuxgsm.sh')

LGSM_URL = 'https://raw.githubusercontent.com/GameServerManagers/LinuxGSM/master/linuxgsm.sh'

%x[mkdir -p #{GAMES_PATH}]
%x[mkdir -p #{BACKUP_PATH}]
%x[mkdir -p #{DELETED_PATH}]

Dir.chdir ROOT_PATH do
  unless File.exist? LGSM_PATH
    %x[wget #{LGSM_URL} #{LGSM_PATH}]
  end
end
