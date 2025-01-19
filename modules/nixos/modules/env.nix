{
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_RENDERER_ALLOW_SOFTWARE = "1"; # enable software rendering for wlroots
      WLR_NO_HARDWARE_CURSORS = "1"; # disable hardware cursors for wlroots
      XMODIFIERS = "@im=fcitx";
      QT_IM_MODULE = "fcitx";
      MOZ_ENABLE_WAYLAND = "1"; # ensure enable wayland for Firefox
    };
    variables = {
      EDITOR = "nvim";
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };
    pathsToLink = [ "/share/zsh" ];
  };
}
