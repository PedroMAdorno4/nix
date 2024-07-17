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
      splitbelow = true;
      splitright = true;
      undofile = true;
      incsearch = true;
      inccommand = "split";
      ignorecase = true;
      smartcase = true;
      scrolloff = 12;
      cursorline = true;
      signcolumn = "yes";
      fileencoding = "utf-8";
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      completeopt = ["menu" "menuone" "noselect"];
    };
  };
}
