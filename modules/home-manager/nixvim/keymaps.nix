{ config
, lib
, ...
}: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
    };

    keymaps =
      let
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
              "<leader>'" = ":Pick resume<CR>";

              # resize with arrows
              "<C-Up>" = ":resize -2<CR>";
              "<C-Down>" = ":resize +2<CR>";
              "<C-Left>" = ":vertical resize +2<CR>";
              "<C-Right>" = ":vertical resize -2<CR>";

              # LSPSaga keymaps 
              "gd" = "<cmd>Lspsaga finder def<CR>";
              "gr" = "<cmd>Lspsaga finder ref<CR>";
              "gi" = "<cmd>Lspsaga finder imp<CR>";
              "gT" = "<cmd>Lspsaga peek_type_definition<CR>";
              "K" = "<cmd>Lspsaga hover_doc<CR>";
              "<leader>lf" = ":lua require('conform').format({ async = true })<CR>";
              "<leader>lo" = "<cmd>Lspsaga outline<CR>";
              "<leader>lr" = "<cmd>Lspsaga rename<CR>";
              "<leader>la" = "<cmd>Lspsaga code_action<CR>";
              "<leader>lA" = '':lua require("actions-preview").code_actions()<CR>'';
              "<leader>ld" = "<cmd>Lspsaga show_line_diagnostics<CR>";
              "]d" = "<cmd>Lspsaga diagnostic_jump_next<CR>";
              "[d" = "<cmd>Lspsaga diagnostic_jump_prev<CR>";

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
        { options.silent = false; }
        (normal ++ visual);
  };
}
