{
  pkgs,
  lib,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    bind = let
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

      switchAudio = pkgs.writeShellScriptBin "switch-audio" ''
        get_all_sinks() {
          ${lib.getExe' pkgs.pulseaudio "pactl"} list short sinks | cut -f 2
        }

        get_all_sink_inputs() {
          ${lib.getExe' pkgs.pulseaudio "pactl"} list short sink-inputs | cut -f 1
        }

        get_default_sink() {
          #pw-play --list-targets | grep \* | tail -n 1 | cut -d' ' -f 2 | cut -d : -f 1
          ${lib.getExe' pkgs.pulseaudio "pactl"} info | grep 'Default Sink' | cut -d':' -f 2
        }

        DEF_SINK=$(get_default_sink)
        for SINK in $(get_all_sinks) ; do
          [ -z "$FIRST" ] && FIRST=$SINK # Save the first index in case the current default is the last in the list
          # get_default_sink currently returns the index with a leading space
          if [ " $SINK" = "$DEF_SINK" ]; then
            NEXT=1;
          # Subsequent pass, don't need continue above
          elif [ -n "$NEXT"  ]; then
            NEW_DEFAULT_SINK=$SINK
            break
          fi
        done

        # Don't particularly like this method of making it circular, but...
        [ -z "$NEW_DEFAULT_SINK" ] && NEW_DEFAULT_SINK=$FIRST

        # Set default sink for new audio playback
        ${lib.getExe' pkgs.pulseaudio "pactl"} set-default-sink "$NEW_DEFAULT_SINK"

        # Move all current inputs to the new default sink
        for INPUT in $(get_all_sink_inputs); do
          ${lib.getExe' pkgs.pulseaudio "pactl"} move-sink-input $INPUT $NEW_DEFAULT_SINK
        done
      '';

      autoClicker =
        pkgs.writers.writePython3Bin "auto-clicker"
        {
          libraries = [pkgs.python3Packages.python-uinput];
          flakeIgnore = ["E265" "E225" "E501"];
        }
        ''
          import os
          import subprocess
          import time

          import uinput

          keys = [uinput.BTN_LEFT]

          filename = "${config.home.homeDirectory}/.toggle"

          if os.path.exists(filename):

              os.remove(filename)

              ps = subprocess.run(["ps", "-aux"], check=True, capture_output=True)
              grep = subprocess.run(
                  ["grep", "auto-clicker"], input=ps.stdout, capture_output=True
              )
              grep2 = subprocess.run(
                  ["grep", "-v", "grep"], input=grep.stdout, capture_output=True, text=True
              )
              pid = grep2.stdout.split(None, 2)[1]
              os.kill(int(pid), 9)
          else:
              with open(filename, "w") as f:
                  f.write("1")
              device = uinput.Device(keys)
              time.sleep(1)
              while True:
                  device.emit(uinput.BTN_LEFT, 1)
                  device.emit(uinput.BTN_LEFT, 0)
                  time.sleep(0.025)
        '';
    in [
      # See the xkbcommon-keysyms.h header for all the keysyms. The name you should use is the segment after XKB_KEY_.
      # https://github.com/xkbcommon/libxkbcommon/blob/master/include/xkbcommon/xkbcommon-keysyms.h
      "$mainMod, RETURN, exec, kitty" #open the terminal
      "$mainMod, Q, killactive," # close the active window
      "$mainMod, Semicolon, exec, hyprlock" # Lock the screen
      "$mainMod, BACKSPACE, exec, wlogout --protocol layer-shell" # show the logout window
      "$mainMod SHIFT, M, exit," # Exit Hyprland all together no (force quit Hyprland)
      "$mainMod, C, exec, ${lib.getExe autoClicker}"
      "$mainMod, E, exec, kitty -e yazi" # Open the terminal file browser
      "$mainMod, F, fullscreen"
      "$mainMod, S, pin"
      "$mainMod SHIFT, E, exec, wofi-emoji" # Open the emoji picker
      "$mainMod SHIFT, SPACE, togglefloating, " # Allow a window to float
      "$mainMod, D, exec, wofi " # Show the graphicall app launcher
      # "$mainMod, A, exec, waydroid show-full-ui " # Show the Android interface
      "$mainMod, T, togglesplit, " # dwindle
      "$mainMod, N, exec, ${lib.getExe rotateMonitor}"
      "$mainMod, M, exec, hyprctl dispatch movecursortocorner 1"
      "$mainMod, Up, exec, busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n +1000 "
      "$mainMod, Down, exec, busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n -1000"

      # Pyprland
      "$mainMod, Y, exec, pypr expose"
      "$mainMod, dead_acute, exec, pypr toggle term"
      "$mainMod, Plus, exec, pypr zoom ++0.01"
      "$mainMod, Minus, exec, pypr zoom --0.01"
      "$mainMod, dead_grave, exec, pypr menu"

      ",121, exec, pamixer -t" # Speaker Mute FN+F1
      ",122, exec, pamixer -d 5 --allow-boost" # Volume lower key
      ",123, exec, pamixer -i 5 --allow-boost" # Volume Higher key
      ",127, exec, ${lib.getExe switchAudio}" # Switch Audio Sink
      "$mainMod, SLASH, exec, pamixer --default-source -t " # Mic mute key
      ",232, exec, brightnessctl set 10%- " # Screen brightness down FN+F7
      ",233, exec, brightnessctl set 10%+ " # Screen brightness up FN+F8
      '', Print, exec, ${lib.getExe pkgs.hyprshot} --mode region --raw | ${lib.getExe pkgs.satty} --early-exit --copy-command wl-copy -f -''

      ",172, exec, playerctl -p ${config.home.musicPlayerMpris} play-pause " # Play-pause music
      ",171, exec, playerctl -p ${config.home.musicPlayerMpris} next " # Next music

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
