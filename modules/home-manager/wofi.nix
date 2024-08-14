{ config, lib, ... }: {
  programs.wofi = {
    enable = true;

    settings = {
      width = 400;
      height = 356;
      location = "center";
      show = "drun";
      prompt = "Search...";
      filter_rate = "100";
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 18;
      gtk_dark = true;
    };

    style =
      let
        colors = config.lib.stylix.colors.withHashtag;
      in
      lib.mkForce ''
        window {
            font-family: "${config.stylix.fonts.monospace.name}";
            font-size: ${toString config.stylix.fonts.sizes.popups};
            margin: 0px;
            border: 5px solid ${colors.base00};
            background-color: ${colors.base00};
            color: ${colors.base05};
            border-radius: 6px;
            font-size: 14px;
        }

        #input {
            padding: 4px;
            margin: 4px;
            padding-left: 8px;
            border: none;
            font-weight: bold;
            background-color: ${colors.base01};
            color: ${colors.base04};
            border-color: ${colors.base02};
            outline: none;
            border-radius: 6px;
            margin-bottom: 2px;
        }
        #input:focus {
            border-color: ${colors.base0A};
        }

        #inner-box {
            margin: 4px;
            border-radius: 12px;
        }

        #outer-box {
            margin: 0px;
            border: none;
            border-radius: 16px;
        }

        #scroll {
            margin-top: 10px;
            border: none;
            border-radius: 16px;
            margin-bottom: 4px;
        }

        #img {
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 6px 0px 0px 6px;
            padding: 3px 8px 2px 4px;
        }

        #img:selected {
            background-color: #2b4d69;
        }

        #text {
          padding: 2px;
          margin-left: 8px;
        };

        #text:selected {
            border-radius: 15px;
        }

        #entry {
            margin: 4px 0px;
            padding: 0px;
            border: none;
            border-radius: 6px;
            background-color: transparent;
        }

        #entry:selected {
            background-color: ${colors.base02};
            outline: none;
        }

        #entry:selected #text {
          font-weight: bold;
          color: ${colors.base06};
        }
      '';
  };

}
