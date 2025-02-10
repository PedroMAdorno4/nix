{pkgs, ...}: {
  programs.nixvim.plugins = {
    coq-nvim = {
      enable = true;
      package = pkgs.vimPlugins.coq_nvim;
      installArtifacts = true;
      settings = {
        auto_start = true;
        keymap.recommended = true;
      };
    };

    # coq-thirdparty = {
    #   enable = true;
    #   sources = [
    #     { src = "nvim_lsp"; short_name = "lsp"; }
    #     { src = "path"; short_name = "path"; }
    #     { src = "buffer"; short_name = "buffer"; }
    #   ];
    #
    # };
  };
}
