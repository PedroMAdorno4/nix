{
  programs.nixvim.plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>fw" = "live_grep";
      "<leader>fb" = "buffers";
      "<leader>fh" = "help_tags";
      "<leader>fg" = "git_files";
      "<leader>fo" = "oldfiles";
      "<leader>fd" = "diagnostics";
      "<leader>'" = "resume";
    };

    settings.defaults = {
      file_ignore_patterns = [
        "^.git/"
        "^node_modules/"
        "^.mypy_cache/"
        "^__pycache__/"
        "^output/"
        "^data/"
        "%.ipynb"
      ];
      set_env.COLORTERM = "truecolor";
    };

    extensions = {
      ui-select = {
        enable = true;
        settings = {
          specific_opts = {
            codeactions = false;
          };
        };
      };
    };
  };
}
