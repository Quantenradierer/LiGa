
possible_types = [
  ['arma3', 'arma3server',	'ARMA 3', ''],
  ['sdtd', 'sdtdserver', '7 Days to Die', ''],
  ['ark', 'arkserver', 'ARK: Survival Evolved', ''],
  ['bo', 'boserver', 'Ballistic Overkill', ''],
  ['bf1942', 'bf1942server', 'Battlefield 1942', ''],
  ['bmdm', 'bmdmserver', 'Black Mesa: Deathmatch', ''],
  ['bs', 'bsserver', 'Blade Symphony', ''],
  ['bb2', 'bb2server', 'BrainBread 2', ''],
  ['cod', 'codserver', 'Call of Duty', ''],
  ['cod2', 'cod2server', 'Call of Duty 2', ''],
  ['cod4', 'cod4server', 'Call of Duty 4', ''],
  ['coduo', 'coduoserver', 'Call of Duty: United Offensive', ''],
  ['codwaw', 'codwawserver', 'Call of Duty: World at War', ''],
  ['cc', 'ccserver', 'Codename CURE', ''],
  ['cs', 'csserver', 'Counter-Strike 1.6', ''],
  ['cscz', 'csczserver', 'Counter-Strike: Condition Zero', ''],
  ['csgo', 'csgoserver', 'Counter-Strike: Global Offensive', ''],
  ['css', 'cssserver', 'Counter-Strike: Source', ''],
  ['dod', 'dodserver', 'Day of Defeat', ''],
  ['dods', 'dodsserver', 'Day of Defeat: Source', ''],
  ['doi', 'doiserver', 'Day of Infamy', ''],
  ['dmc', 'dmcserver', 'Deathmatch Classic', ''],
  ['dst', 'dstserver', 'Don\'t Starve Together', ''],
  ['dab', 'dabserver', 'Double Action: Boogaloo', ''],
  ['em', 'emserver', 'Empires Mod', ''],
  ['fctr', 'fctrserver', 'Factorio', ''],
  ['fof', 'fofserver', 'Fistful of Frags', ''],
  ['gmod', 'gmodserver', 'Garrys Mod', ''],
  ['ges', 'gesserver', 'GoldenEye: Source', ''],
  ['hl2dm', 'hl2dmserver', 'Half-Life 2: Deathmatch', ''],
  ['hldms', 'hldmsserver', 'Half-Life Deathmatch: Source', ''],
  ['hldm', 'hldmserver', 'Half-Life: Deathmatch', ''],
  ['hw', 'hwserver', 'Hurtworld', ''],
  ['ins', 'insserver', 'Insurgency', ''],
  ['jc2', 'jc2server', 'Just Cause 2', ''],
  ['kf', 'kfserver', 'Killing Floor', ''],
  ['kf2', 'kf2server', 'Killing Floor 2', ''],
  ['l4d', 'l4dserver', 'Left 4 Dead', ''],
  ['l4d2', 'l4d2server', 'Left 4 Dead 2', ''],
  ['mc', 'mcserver', 'Minecraft', ''],
  ['mta', 'mtaserver', 'Multi Theft Auto', ''],
  ['mumble', 'mumbleserver', 'Mumble', ''],
  ['ns2', 'ns2server', 'Natural Selection 2', ''],
  ['nmrih', 'nmrihserver', 'No More Room in Hell', ''],
  ['ns2c', 'ns2cserver', 'NS2: Combat', ''],
  ['opfor', 'opforserver', 'Opposing Force', ''],
  ['pvkii', 'pvkiiserver', 'Pirates Vikings & Knights II', ''],
  ['pc', 'pcserver', 'Project Cars', ''],
  ['pz', 'pzserver', 'Project Zomboid', ''],
  ['q2', 'q2server', 'Quake 2', ''],
  ['q3', 'q3server', 'Quake 3: Arena', ''],
  ['ql', 'qlserver', 'Quake Live', ''],
  ['qw', 'qwserver', 'Quake World', ''],
  ['ro', 'roserver', 'Red Orchestra: Ostfront 41-45', ''],
  ['ricochet', 'ricochetserver', 'Ricochet', ''],
  ['rust', 'rustserver', 'Rust', ''],
  ['samp', 'sampserver', 'San Andreas Multiplayer', ''],
  ['ss3', 'ss3server', 'Serious Sam 3: BFE', ''],
  ['sb', 'sbserver', 'Starbound', ''],
  ['squad', 'squadserver', 'Squad', ''],
  ['sven', 'svenserver', 'Sven Co-op', ''],
  ['tf2', 'tf2server', 'Team Fortress 2', ''],
  ['tfc', 'tfcserver', 'Team Fortress Classic', ''],
  ['ts3', 'ts3server', 'Teamspeak 3', ''],
  ['tw', 'twserver', 'Teeworlds', ''],
  ['terraria', 'terrariaserver', 'Terraria', ''],
  ['tu', 'tuserver', 'Tower Unite', ''],
  ['ut2k4', 'ut2k4server', 'Unreal Tournament 2004', ''],
  ['ut3', 'ut3server', 'Unreal Tournament 3', ''],
  ['ut99', 'ut99server', 'Unreal Tournament 99', ''],
  ['wet', 'wetserver', 'Wolfenstein: Enemy Territory', ''],
  ['zps', 'zpsserver', 'Zombie Panic! Source', '']
]

configurations = [
  ['mc', 0, 'FileConf', 'server.properties', '', 0, 0],
  ['mc', 0, 'FileConf', 'banned-ips.json', '', 0, 0],
  ['mc', 0, 'FileConf', 'banned-players.json', '', 0, 0],
  ['mc', 0, 'FileConf', 'whitelist.json', '', 0, 0],
  ['mc', 0, 'FileConf', 'ops.json', '', 0, 0],
]

possible_types.each do |short, name, description, configs|
  Gametype.create(shortname: short,
                  name: name,
                  description: description)
end

configurations.each do |short, priority, configurator, file, key, datatype, constraint|
  Config.create(gametype: Gametype.find_by(shortname: short),
                priority: priority,
                configurator: configurator,
                file: file,
                key: key,
                datatype: datatype,
                constraint: constraint)
end








puts 'Creating default user'

password = [*('a'..'z'), *('A'..'Z'), *('0'..'9')].shuffle[0, 16].join
admin = User.create(email: 'admin', password: password)

puts 'User: admin'
puts "Password: #{password}"
puts 'SAVE THIS PASSWORD!!!'

