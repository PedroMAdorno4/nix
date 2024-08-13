{ pkgs, lib, config, ... }: {
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

        switchAudio = pkgs.writeShellScriptBin "switch-audio" ''
          function get_current_sink() {
            pactl info | sed -En 's/Default Sink: (.*)/\1/p'
          }

          SINKS=$(pactl list short sinks | grep -v easyeffects)
          SINK_COUNT=$(echo "$SINKS" | wc -l)

          CURRENT_SINK=$(get_current_sink)
          CURRENT_SINK_INDEX=$(echo "$SINKS" | grep -n "$CURRENT_SINK" | grep -Eo '^[0-9]+')

          MAX_RETRIES=6
          RETRIES=0

          while true; do
            [ "$RETRIES" -ge "$MAX_RETRIES" ] && echo "Reached retry limit of $MAX_SINK_SKIPS, giving up." && break

            NEW_SINK_INDEX=$(((CURRENT_SINK_INDEX + $RETRIES) % $SINK_COUNT + 1))
            NEW_SINK=$(echo "$SINKS" | sed "''${NEW_SINK_INDEX}q;d" | awk '{ print $2 }')

            echo "Switching to sink: $NEW_SINK"
            pactl set-default-sink "$NEW_SINK"

            [ "$(get_current_sink)" = "$NEW_SINK" ] && break

            # Note: switching could fail if, for example, the new sink does not have any available output port
            echo "Failed to switch to sink: $NEW_SINK, skipping to next sink..."
            RETRIES=$((RETRIES + 1))
          done

          # Forward all playing audio (sink inputs) to the new sink (Uncomment if your system does not automatically do this)
          #SINK_INPUTS=($(pactl list short sink-inputs | grep -Eo '^[0-9]+'))
          #for SINK_INPUT in ''${SINK_INPUTS[*]}; do pactl move-sink-input $SINK_INPUT $NEW_SINK; done
        '';
      in
      [
        "$mainMod, RETURN, exec, kitty" #open the terminal
        "$mainMod, W, exec, kitty" #open the terminal
        "$mainMod, Q, killactive," # close the active window
        # "$mainMod SHIFT, L, exec, hyprlock" # Lock the screen
        "$mainMod, BACKSPACE, exec, wlogout --protocol layer-shell" # show the logout window
        "$mainMod SHIFT, M, exit," # Exit Hyprland all together no (force quit Hyprland)
        "$mainMod, E, exec, kitty -e yazi" # Open the terminal file browser
        "$mainMod, F, fullscreen"
        "$mainMod, S, pin"
        "$mainMod SHIFT, E, exec, wofi-emoji" # Open the emoji picker
        "$mainMod SHIFT, SPACE, togglefloating, " # Allow a window to float
        "$mainMod, D, exec, wofi " # Show the graphicall app launcher
        # "$mainMod, A, exec, waydroid show-full-ui " # Show the Android interface
        "$mainMod, P, exec, hyprpicker | wl-copy " # Color picker
        "$mainMod, T, togglesplit, " # dwindle
        "$mainMod, N, exec, ${lib.getExe rotateMonitor}"
        "$mainMod, M, exec, hyprctl dispatch movecursortocorner 1"

        '',107, exec, grim -g "$(slurp)" - | swappy -f - '' # take a screenshot
        ",121, exec, pamixer -t" # Speaker Mute FN+F1
        ",122, exec, pamixer -d 5" # Volume lower key
        ",123, exec, pamixer -i 5" # Volume Higher key
        ",127, exec, ${lib.getExe switchAudio}" # Switch Audio Sink
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
