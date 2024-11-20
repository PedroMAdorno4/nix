{
  services.logind.extraConfig = ''
    # want to be able to listen to music while laptop closed
    LidSwitchIgnoreInhibited=no
  '';
}
