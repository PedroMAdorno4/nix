{
  programs.nixvim.plugins.mini = {
    enable = true;

    modules = {
      # align = {};
      # animate = { };
      basics = {
        options.extra_ui = true;
      };
      # completion = {};
      # clue = { };
      # cursorword = {};
      # doc = {};
      # extra = { };
      indentscope = {};
      pick = { };
      # trailspace = { };
      # misc = { };
      surround = {};
      # icons = { };
    };
  };
}
