{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        exclusive = true;
        gtk-layer-shell = true;
        height = 30;
        layer = "top";
        mod = "dock";
        modules-center = [ "mpris" ];
        modules-left = [
          "hyprland/workspaces"
          "memory"
          "cpu"
        ];
        modules-right = [
          "backlight"
          "network"
          "pulseaudio"
          "pulseaudio#microphone"
          "clock"
          "tray"
        ];
        tray = {
          icon-size = 18;
          spacing = 10;
        };


        # Module definitions
        backlight = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
          min-length = 6;
          on-scroll-down = "brightnessctl set 1%-";
          on-scroll-up = "brightnessctl set 1%+";
        };
        battery = {
          format = "{icon} {capacity}%";
          format-alt = "{time} {icon}";
          format-charging = " {capacity}%";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          format-plugged = " {capacity}%";
          states = {
            critical = 20;
            good = 95;
            warning = 30;
          };
        };
        bluetooth = {
          format = " {status}";
          format-connected = " {num_connections}";
          format-disabled = "";
          tooltip-format = "{device_alias}";
          tooltip-format-connected = " {device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}";
        };
        clock = {
          format = " {:%H:%M   %a, %b %e}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        cpu = {
          format = "󰍛 {usage}%";
          interval = 10;
        };
        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = false;
          disable-scroll = true;
          on-click = "activate";
          persistent-workspaces = {
            # "1" = [ "DP-3" ];
            # "2" = [ "DP-3" ];
            # "3" = [ "DP-3" ];
            # "4" = [ "DP-3" ];
            # "5" = [ "DP-3" ];
            # "6" = [ "DP-3" ];
            # "7" = [ "DP-3" ];
            # "8" = [ "DP-3" ];
            # "9" = [ "DP-3" ];
            # "10" = [ "DP-3" ];
            # "11" = [ "HDMI-A-1" ];
            # "12" = [ "HDMI-A-1" ];
            # "13" = [ "HDMI-A-1" ];
            # "14" = [ "HDMI-A-1" ];
            # "15" = [ "HDMI-A-1" ];
            # "16" = [ "HDMI-A-1" ];
            # "17" = [ "HDMI-A-1" ];
            # "18" = [ "HDMI-A-1" ];
            # "19" = [ "HDMI-A-1" ];
            # "20" = [ "HDMI-A-1" ];
          };
          sort-by-number = true;
        };
        memory = {
          format = "󰾅 {used}GB";
          interval = 30;
          max-length = 10;
          tooltip = true;
          tooltip-format = " {used:0.1f}GB/{total:0.1f}GB";
        };
        mpris = {
          artist-len = 20;
          player = "ncspot";
          format = "{status_icon} {artist} - {title} <small>[{position}-{length}]</small>";
          interval = 1;
          status-icons = {
            paused = "|>";
            playing = "||";
          };
          title-len = 30;
        };
        network = {
          format-alt = "{ifname}:{essid} {ipaddr}/{cidr}";
          format-disconnected = "Disconnected ⚠";
          format-ethernet = "{ipaddr}/{cidr}";
          format-linked = "{ifname} (No IP)";
          format-wifi = "  {signalStrength}%";
          tooltip-format = "{essid} - {ifname} via {gwaddr}";
        };
        passthrough = false;
        position = "top";
        pulseaudio = {
          format = "{icon} {volume}%";
          format-icons = {
            car = "";
            default = [
              ""
              ""
              ""
            ];
            hands-free = "";
            headphone = "";
            headset = "";
            phone = "";
            portable = "";
          };
          format-muted = " Muted";
          on-click = "pamixer -t";
          on-scroll-down = "pamixer -d 5";
          on-scroll-up = "pamixer -i 5";
          scroll-step = 5;
          tooltip = false;
        };
        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = " Muted";
          on-click = "pamixer --default-source -t";
          on-scroll-down = "pamixer --default-source -d 5";
          on-scroll-up = "pamixer --default-source -i 5";
          scroll-step = 5;
        };
        temperature = {
          critical-threshold = 80;
          format = "{temperatureF}°F ";
          format-critical = "{temperatureC}°C ";
          thermal-zone = 1;
        };

      };
    };

    style = ''
      * {
          border: none;
          border-radius: 0;
          font-family: "JetBrainsMono Nerd Font";
          font-weight: bold;
          font-size: 12px;
          min-height: 0;
      }

      window#waybar {
          background: rgba(21, 18, 27, 0);
          color: #cdd6f4;
      }

      tooltip {
          background: #1e1e2e;
          border-radius: 6px;
          border-width: 2px;
          border-style: solid;
          border-color: #11111b;
      }

      #workspaces button {
          padding: 5px;
          color: #8c8c8c;
          margin-right: 5px;
      }

      #workspaces button.active {
          color: #ced8ff;
      }

      #workspaces button.focused {
          color: #a6adc8;
          background: #eba0ac;
          border-radius: 6px;
      }

      #workspaces button.urgent {
          color: #11111b;
          background: #a6e3a1;
          border-radius: 6px;
      }

      #workspaces button:hover {
          background: #11111b;
          color: #cdd6f4;
          border-radius: 6px;
      }

      #custom-power_profile,
      #cpu,
      #memory,
      #custom-weather,
      #window,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #bluetooth,
      #temperature,
      #workspaces,
      #tray,
      #mpris,
      #backlight {
          background: #1e1e2e;
          opacity: 0.8;
          padding: 0px 6px;
          margin: 3px 0px;
          margin-top: 6px;
          border: 1px solid #181825;
      }

      #temperature {
          border-radius: 6px 0px 0px 6px;
      }

      #temperature.critical {
          color: #eba0ac;
      }

      #backlight {
          border-radius: 6px 0px 0px 6px;
      }

      #tray {
          border-radius: 6px;
          margin-right: 6px;
      }

      #workspaces {
          background: #1e1e2e;
          border-radius: 6px;
          margin-left: 8px;
          padding-right: 0px;
          padding-left: 5px;
      }

      #custom-power_profile {
          color: #a6e3a1;
          border-left: 0px;
          border-right: 0px;
      }

      #window {
          border-radius: 6px;
          margin-left: 60px;
          margin-right: 60px;
      }

      #clock {
          color: #fab387;
          border-radius: 6px 6px 6px 6px;
          margin-left: 6px;
          margin-right: 8px;
      }

      #network {
          color: #f9e2af;
          border-radius: 6px 0px 0px 6px;
          border-left: 0px;
          border-right: 0px;
      }

      #bluetooth {
          color: #89b4fa;
          border-radius: 0px 6px 6px 0px;
          margin-right: 6px
      } 

      #pulseaudio {
          color: #89b4fa;
          border-left: 0px;
          border-radius: 6px 0px 0px 6px;
          border-right: 0px;
      }

      #pulseaudio.microphone {
          color: #cba6f7;
          border-left: 0px;
          border-right: 0px;
          border-radius: 0px 6px 6px 0px;
      }

      #battery {
          color: #a6e3a1;
          border-radius: 0 6px 6px 0;
          margin-right: 6px;
          border-left: 0px;
      }

      #cpu {
          color: #a6e3a1;
          border-radius: 0 6px 6px 0;
          margin-right: 6px;
          border-left: 0px;
      }

      #memory {
          color: #a6e3a1;
          border-radius: 6px 0px 0px 6px;
          margin-right: 0px;
          border-right: 0px;
      }

      #custom-weather {
          border-radius: 0px 6px 6px 0px;
          border-right: 0px;
          margin-left: 0px;
      }

      #mpris {
          color: #a6e3a1;
          border-radius: 6px 6px 6px 6px;
      }

      #mpris > small {
          color: #ffffff;
      }
    '';
  };
}
