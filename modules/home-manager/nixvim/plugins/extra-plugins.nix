{ pkgs, ... }: {
  programs.nixvim.extraPlugins = [
    pkgs.vimPlugins.actions-preview-nvim
    (pkgs.vimUtils.buildVimPlugin {
      name = "supermaven-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "supermaven-inc";
        repo = "supermaven-nvim";
        rev = "d71257f431e190d9236d7f30da4c2d659389e91f";
        hash = "sha256-v5OIPQJhNdZA3Prw6DGq8fRxsmKvouGbt0IKhAZdlQM=";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "venv-selector";
      src = pkgs.fetchFromGitHub {
        owner = "linux-cultist";
        repo = "venv-selector.nvim";
        rev = "c43dc6bf8c7e7cf124a991775ed3defe87112d3a";
        hash = "sha256-puF9GaP+o0JBARdaid4JNgwfcOH94ipJQCWi+hP98R4=";
      };
    })
  ];

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
  '';
}
