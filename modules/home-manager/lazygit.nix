{ lib, config, ... }: {

  programs.lazygit.enable = true;
  programs.lazygit.settings.gui.theme = {
    selectedLineBgColor = lib.mkForce [ config.lib.stylix.colors.withHashtag.base02 ];
    nerdFontsVersion = "3";
  };
}
