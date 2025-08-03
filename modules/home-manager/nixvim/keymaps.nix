{
  config,
  lib,
  ...
}: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
    };

    keymaps = let
      normal =
        lib.mapAttrsToList
        (key: action: {
          mode = "n";
          inherit action key;
        })
        {
          # Open Neotree
          "<leader>e" = ":Oil<CR>";

          # Esc to clear search results
          "<esc>" = ":noh<CR>";

          # fix Y behaviour
          Y = "y$";

          # back and fourth between the two most recent files
          "<C-c>" = ":b#<CR>";

          "<leader>u" = ":UndotreeToggle<CR>";

          # Mini pick
          "<leader>ff" = ":Pick files<CR>";
          "<leader>fw" = ":Pick grep_live<CR>";
          "<leader>h" = ":Pick help<CR>";

          # resize with arrows
          "<C-Up>" = ":resize -2<CR>";
          "<C-Down>" = ":resize +2<CR>";
          "<C-Left>" = ":vertical resize +2<CR>";
          "<C-Right>" = ":vertical resize -2<CR>";

          # move current line up/down
          # M = Alt key
          "<M-k>" = ":move-2<CR>";
          "<M-j>" = ":move+<CR>";

          "<leader>gs" = ":LazyGit<CR>";
        };
      visual =
        lib.mapAttrsToList
        (key: action: {
          mode = "v";
          inherit action key;
        })
        {
          # move selected line / block of text in visual mode
          "K" = ":m '<-2<CR>gv=gv";
          "J" = ":m '>+1<CR>gv=gv";
        };
    in
      config.lib.nixvim.keymaps.mkKeymaps
      {options.silent = false;}
      (normal ++ visual);
  };
}
