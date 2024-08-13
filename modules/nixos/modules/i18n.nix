{ pkgs, ... }: {
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod =
      {
        enable = true;
        type = "fcitx5";
        fcitx5 = {
          waylandFrontend = true;
          addons = with pkgs; [
            fcitx5-mozc
            fcitx5-gtk
            fcitx5-nord
          ];
        };
      };

    extraLocaleSettings = {
      LC_TIME = "pt_BR.UTF-8";
    };
    supportedLocales = [ "all" ];
  };
}
