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
