{
  programs.nixvim.extraConfigLua = ''
     require("actions-preview").setup {
       telescope = {
         sorting_strategy = "ascending",
         layout_strategy = "vertical",
         layout_config = {
           width = 0.8,
           height = 0.9,
           prompt_position = "top",
           preview_cutoff = 20,
           preview_height = function(_, _, max_lines)
             return max_lines - 15
           end,
         },
       },
     }
    require('venv-selector').setup {
     }
    require("supermaven-nvim").setup({})
    -- require("otter").activate()
    require("sad").setup({})
  '';
}
