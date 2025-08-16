{
  programs.nixvim = {
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    opts = {
      updatetime = 100;
      relativenumber = true;
      number = true;
      wrap = false;
      splitbelow = true;
      splitright = true;
      undofile = true;
      incsearch = true;
      inccommand = "split";
      ignorecase = true;
      smartcase = true;
      scrolloff = 12;
      cursorline = false;
      signcolumn = "no";
      fileencoding = "utf-8";
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      mouse = "";
      completeopt = ["menu" "menuone" "noselect"];
      winborder = "rounded";
    };
  };
}
