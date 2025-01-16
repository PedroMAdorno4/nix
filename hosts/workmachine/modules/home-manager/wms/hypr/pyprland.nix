{ config, pkgs, ... }: {
  home.file."${config.xdg.configHome}/hypr/pyprland.toml".source = (pkgs.formats.toml { }).generate "pyprland-config" {
    pyprland = {
      plugins = [
        "scratchpads"
        "magnify"
        "expose"
        "shortcuts_menu"
        # "monitors"
      ];
    };

    scratchpads.term = {
      animation = "fromTop";
      command = "kitty --class scratchpad-term";
      class = "scratchpad-term";
      size = "50% 75%";
      unfocus = "hide";
      lazy = true;
    };

    shortcuts_menu = {
      entries = {
        "Clipboard history" = [
          {
            command = "cliphist list";
            filter = "s/\t.*//";
            name = "entry";
          }
          "cliphist decode '[entry]' | wl-copy"
        ];
        "Color picker" = [
          {
            name = "format";
            options = [
              "hex"
              "rgb"
              "hsv"
              "hsl"
              "cmyk"
            ];
          }
          "sleep 0.2; hyprpicker --format [format] | wl-copy"
        ];
        "Copy public ssh key" = [
          {
            command = "ls ~/.ssh/*.pub";
            name = "key";
          }
          "cat [key] | wl-copy"
        ];
        Relayout = "pypr relayout";
      };
    };

  };
}
