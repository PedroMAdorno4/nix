{
  programs.wofi = {
    enable = true;

    settings = {
      width = 400;
      height = 350;
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

    style = ''
      window {
          margin: 0px;
          border: 5px solid #1e1e2e;
          background-color: #1e1e2e;
          border-radius: 6px;
          font-size: 14px;
      }

      #input {
          padding: 4px;
          margin: 4px;
          padding-left: 20px;
          border: none;
          color: #cdd6f4;
          font-weight: bold;
          background-color: #1e1e2e;
          background: ;
          outline: none;
          border-radius: 6px;
          margin: 10px;
          margin-bottom: 2px;
      }
      #input:focus {
          border: 0px solid #1e1e2e;
          margin-bottom: 0px;
      }

      #inner-box {
          margin: 4px;
          border: 10px solid #1e1e2e;
          color: #cdd6f4;
          font-weight: bold;
          background-color: #1e1e2e;
          border-radius: 15px;
      }

      #outer-box {
          margin: 0px;
          border: none;
          border-radius: 15px;
          background-color: #1e1e2e;
      }

      #scroll {
          margin-top: 5px;
          border: none;
          border-radius: 15px;
          margin-bottom: 5px;
          /* background: rgb(255,255,255); */
      }

      #img {
          border-radius: 6px;
          margin-right: 8px;
      }

      #img:selected {
          background-color: #89b4fa;
      }

      #text:selected {
          color: #cdd6f4;
          border: none;
          border-radius: 15px;
          background-color: #89b4fa;
      }

      #entry {
          margin: 4px 0px;
          border: none;
          border-radius: 6px;
          background-color: transparent;
      }

      #entry:selected {
          border: none;
          background-color: #89b4fa;
      }
    '';
  };
    
}
