{ pkgs, lib, ... }:
{
  services.greetd =
    let
      niri-config = pkgs.writeText "niri-config" ''
        hotkey-overlay {
            skip-at-startup
        }

        input {
          keyboard {
              xkb {
                  layout "us"
                  variant "intl"
              }
              repeat-delay 200
              repeat-rate 35
              numlock
          }

          mouse {
              accel-speed -1
          }
        }

        environment {
            GTK_USE_PORTAL "0"
            GDK_DEBUG "no-portals"
        }

        clipboard {
            disable-primary
        }

        output "DP-2" {
            mode "1920x1080@143.981"
            scale 1
            transform "normal"
            position x=0 y=0
        }

        output "HDMI-A-1" {
            off
            // mode "1920x1080@60.000"
            // scale 1
            // transform "normal"
            // position x=1920 y=0
        }

        spawn-sh-at-startup "${pkgs.regreet}/bin/regreet; niri msg action quit --skip-confirmation"
      '';
    in
    {
      enable = true;
      settings = {
        default_session = {
          command = "niri -c ${niri-config}";
          user = "greeter";
        };
      };
    };

  programs.regreet = {
    enable = true;

    cursorTheme.name = lib.mkForce "Bibata-Modern-Ice";
    # cursorTheme.package = lib.mkForce pkgs.bibata-cursors;

    theme = lib.mkForce {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };

    iconTheme = lib.mkForce {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };
  };
}
