{pkgs, lib, config, ...}: {
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    bind =
      let
        rotateMonitor = pkgs.writeShellScriptBin "rotate-monitor" ''
          newTransform=$((`hyprctl monitors -j | jq -r '${config.home.sessionVariables.secondaryMonitorPortraitTransform} - (.[] | select(.name | contains("${config.home.sessionVariables.secondaryMonitorName}")).transform)'`))
          folder=""
          if [[ $newTransform == "0" ]]; then
            folder="landscape"
          else
            folder="portrait"
          fi


          echo loadlist ${config.home.homeDirectory}/videos/wallpapers/$folder | ${pkgs.socat}/bin/socat - /tmp/mpv-socket
          hyprctl keyword monitor ${config.home.sessionVariables.secondaryMonitor},transform,$newTransform
        '';
      in [
      "$mainMod, RETURN, exec, kitty" #open the terminal
      "$mainMod, W, exec, kitty" #open the terminal
      "$mainMod, Q, killactive," # close the active window
      "$mainMod SHIFT, L, exec, hyprlock" # Lock the screen
      "$mainMod, BACKSPACE, exec, wlogout --protocol layer-shell" # show the logout window
      "$mainMod SHIFT, M, exit," # Exit Hyprland all together no (force quit Hyprland)
      "$mainMod, E, exec, kitty -e yazi" # Open the terminal file browser
      "$mainMod, F, fullscreen"
      "$mainMod, S, pin"
      "$mainMod SHIFT, E, exec, wofi-emoji" # Open the emoji picker
      "$mainMod SHIFT, SPACE, togglefloating, " # Allow a window to float
      "$mainMod, D, exec, wofi " # Show the graphicall app launcher
      "$mainMod, P, exec, hyprpicker | wl-copy " # Color picker
      "$mainMod, T, togglesplit, " # dwindle
      "$mainMod, N, exec, ${lib.getExe rotateMonitor}"
      "$mainMod, M, exec, hyprctl dispatch movecursortocorner 1"

      '',107, exec, grim -g "$(slurp)" - | swappy -f - '' # take a screenshot
      ",121, exec, pamixer -t " # Speaker Mute FN+F1
      ",122, exec, pamixer -d 5 " # Volume lower key
      ",123, exec, pamixer -i 5 " # Volume Higher key
      ",127, exec, switch-audio " # Switch Audio Sink
      "$mainMod, SLASH, exec, pamixer --default-source -t " # Mic mute key
      ",232, exec, brightnessctl set 10%- " # Screen brightness down FN+F7
      ",233, exec, brightnessctl set 10%+ " # Screen brightness up FN+F8

      ",172, exec, playerctl -p ncspot play-pause " # Play-pause music
      ",171, exec, playerctl -p ncspot next " # Next music

      # Move focus with mainMod + vim keys
      "$mainMod, H, movefocus, l"
      "$mainMod, J, movefocus, d"
      "$mainMod, K, movefocus, u"
      "$mainMod, L, movefocus, r"

      # Move window with mainMod + Shift + vim keys
      "$mainMod SHIFT, H, swapwindow, l"
      "$mainMod SHIFT, J, swapwindow, d"
      "$mainMod SHIFT, K, swapwindow, u"
      "$mainMod SHIFT, L, swapwindow, r"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, split-workspace, 1"
      "$mainMod, 2, split-workspace, 2"
      "$mainMod, 3, split-workspace, 3"
      "$mainMod, 4, split-workspace, 4"
      "$mainMod, 5, split-workspace, 5"
      "$mainMod, 6, split-workspace, 6"
      "$mainMod, 7, split-workspace, 7"
      "$mainMod, 8, split-workspace, 8"
      "$mainMod, 9, split-workspace, 9"
      "$mainMod, 0, split-workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, 1, split-movetoworkspacesilent, 1"
      "$mainMod SHIFT, 2, split-movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, split-movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, split-movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, split-movetoworkspacesilent, 5"
      "$mainMod SHIFT, 6, split-movetoworkspacesilent, 6"
      "$mainMod SHIFT, 7, split-movetoworkspacesilent, 7"
      "$mainMod SHIFT, 8, split-movetoworkspacesilent, 8"
      "$mainMod SHIFT, 9, split-movetoworkspacesilent, 9"
      "$mainMod SHIFT, 0, split-movetoworkspacesilent, 10"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
