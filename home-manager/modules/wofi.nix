{
  programs.wofi = {
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
  };
}
