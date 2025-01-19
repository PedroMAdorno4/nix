{ pkgs, ... }: {
  programs.nixvim.extraPlugins = [
    pkgs.vimPlugins.actions-preview-nvim
    pkgs.vimPlugins.supermaven-nvim
    # (pkgs.vimUtils.buildVimPlugin {
    #   name = "venv-selector";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "linux-cultist";
    #     repo = "venv-selector.nvim";
    #     rev = "c43dc6bf8c7e7cf124a991775ed3defe87112d3a";
    #     hash = "sha256-puF9GaP+o0JBARdaid4JNgwfcOH94ipJQCWi+hP98R4=";
    #   };
    # })
    # (pkgs.vimUtils.buildVimPlugin {
    #   name = "sad";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "ray-x";
    #     repo = "sad.nvim";
    #     rev = "869c7f3ca3dcd28fd78023db6a7e1bf8af0f4714";
    #     hash = "sha256-uwXldYA7JdZHqoB4qfCnZcQW9YBjlRWmiz8mKb9jHuI=";
    #   };
    # })
    # (pkgs.vimUtils.buildVimPlugin {
    #   name = "guihua";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "ray-x";
    #     repo = "guihua.lua";
    #     rev = "225db770e36aae6a1e9e3a65578095c8eb4038d3";
    #     hash = "sha256-V5rlORFlhgjAT0n+LcpMNdY+rEqQpur/KGTGH6uFxMY=";
    #   };
    # })
  ];

}
