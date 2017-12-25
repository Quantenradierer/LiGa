
RIGHTS = {
  show?: 2**0,
  edit?: 2**1,
  update?: 2**2,
  destroy?: 2**3,
  upgrade?: 2**4,
  upgrade_lgsm?: 2**5,
  start?: 2**6,
  stop?: 2**7,
  console?: 2**8,
  backup?: 2**9,
  logs?: 2**10,
  edit_config_low?: 2**11,
  # low important config files, like the game mode

  edit_config_medium?: 2**12,
  # medium important config files, like the game operators

  edit_config_high?: 2**13,
  # high important config files, like the used memory, port, and game administrators

  rights?: 2**14
}.freeze
