{
  programs.nixvim.colorschemes.tokyonight = {
    enable = true;
    autoLoad = true;
    settings = {
      transparent = true;
      styles = {
        comments = {
          italic = true;
        };
        floats = "dark";
        functions = { };
        keywords = {
          italic = true;
        };
        sidebars = "dark";
        variables = { };
      };
    };
  };
}
