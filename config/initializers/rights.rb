
RIGHTS = {
    :show? => 1,
    :edit? => 2,
    :update? => 4,
    :upgrade? => 8,
    :upgrade_lgsm? => 16,
    :start? => 32,
    :stop? => 64,
    :console? => 128,
    :backup? => 256,
    :logs? => 512,
    :edit_config_low? => 1024,
    # low important config files, like the game mode

    :edit_config_medium? => 2048,
    # medium important config files, like the game operators

    :edit_config_high? => 4096,
    # high important config files, like the used memory, port, and game administrators
}
