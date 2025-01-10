{
  programs.nixvim = {
    autoGroups = {
      highlight_yank = { };
      vim_enter = { };
      indentscope = { };
      restore_cursor = { };
    };
    autoCmd = [
      {
        event = [ "VimEnter" ];
        command = ":TransparentEnable";
      }
      {
        event = [ "VimEnter" ];
        command = ":Obsess";
      }
      {
        event = [ "VimEnter" ];
        command = "colorscheme tokyonight";
      }
      #      {
      #        event = [ "BufAdd" ];
      #        command = ":lua require('otter').activate()<CR>";
      #      }
      {
        group = "highlight_yank";
        event = [ "TextYankPost" ];
        pattern = "*";
        callback = {
          __raw = ''
            function()
              vim.highlight.on_yank()
            end
          '';
        };
      }
      ## from NVChad https://nvchad.com/docs/recipes (this autocmd will restore the cursor position when opening a file)
      {
        group = "restore_cursor";
        event = [ "BufReadPost" ];
        pattern = "*";
        callback = {
          __raw = ''
            function()
              if
                vim.fn.line "'\"" > 1
                and vim.fn.line "'\"" <= vim.fn.line "$"
                and vim.bo.filetype ~= "commit"
                and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
              then
                vim.cmd "normal! g`\""
              end
            end
          '';
        };
      }
    ];
  };
}
