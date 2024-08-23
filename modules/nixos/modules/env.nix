{
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      XMODIFIERS = "@im=fcitx";
      QT_IM_MODULE = "fcitx";
    };
    variables = {
      EDITOR = "nvim";
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };
    pathsToLink = [ "/share/zsh" ];
  };
}
