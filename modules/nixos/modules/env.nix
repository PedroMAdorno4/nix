{lib, ...}: {
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      QT_IM_MODULE = "fcitx";
      QT_QPA_PLATFORM = "wayland;xcb FreeCAD";
      MOZ_ENABLE_WAYLAND = "1"; # ensure enable wayland for Firefox
    };
    variables = {
      EDITOR = "nvim";
    };
    pathsToLink = ["/share/zsh"];
  };
}
