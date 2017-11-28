
GAMES_PATH = '/home/quantenradierer/RubymineProjects/teslacoil/LinuxGSM'
BACKUP_PATH = '/home/quantenradierer/RubymineProjects/teslacoil/Backup'
DELETED_PATH = '/home/quantenradierer/RubymineProjects/teslacoil/Deleted'
LGSM_NAME = 'linuxgsm.sh'

LGSM_PATH = 'https://github.com/GameServerManagers/LinuxGSM'

%x[mkdir -p #{GAMES_PATH}]
%x[mkdir -p #{BACKUP_PATH}]
%x[mkdir -p #{DELETED_PATH}]

