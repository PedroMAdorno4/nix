{
  programs.nixvim.plugins.lspsaga = {
    enable = true;
    beacon = {
      enable = true;
    };
    ui = {
      border = "rounded"; # One of none, single, double, rounded, solid, shadow
      codeAction = "💡"; # Can be any symbol you want 💡
    };
    hover = {
      openCmd = "!brave"; # Choose your browser
      openLink = "gx";
    };
    diagnostic = {
      borderFollow = true;
      diagnosticOnlyCurrent = false;
      showCodeAction = true;
    };
    symbolInWinbar = {
      enable = true; # Breadcrumbs
    };
    codeAction = {
      extendGitSigns = false;
      showServerName = true;
      onlyInCursor = false;
      numShortcut = true;
      keys = {
        exec = "<CR>";
        quit = ["<Esc>" "q"];
      };
    };
    lightbulb = {
      enable = false;
      sign = false;
      virtualText = true;
    };
    implement = {
      enable = true;
    };
    rename = {
      autoSave = false;
      keys = {
        exec = "<CR>";
        quit = ["<Esc>" "q"];
        select = "x";
      };
    };
    outline = {
      autoClose = true;
      autoPreview = true;
      closeAfterJump = true;
      layout = "normal"; # normal or float
      winPosition = "right"; # left or right
      keys = {
        jump = "e";
        quit = ["<Esc>" "q"];
        toggleOrJump = "o";
      };
    };
    scrollPreview = {
      scrollDown = "<C-d>";
      scrollUp = "<C-u>";
    };
  };
}
