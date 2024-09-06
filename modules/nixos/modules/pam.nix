{
  security.pam = {
    services.login.gnupg = {
      enable = true;
      noAutostart = true;
      storeOnly = true;
    };
    services.i3lock.gnupg = {
      enable = true;
      noAutostart = true;
    };
  };
}
