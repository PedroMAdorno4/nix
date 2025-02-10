{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = false;

      settings = {
        auto_install = true;
        ensure_installed = "all";
        highlight = {
          additional_vim_regex_highlighting = true;
          custom_captures = {};
          enable = true;
        };

        indent = {
          enable = true;
        };
      };
    };

    # treesitter-refactor = {
    #   enable = true;
    #   highlightDefinitions = {
    #     enable = true;
    #     # Set to false if you have an `updatetime` of ~100.
    #     clearOnCursorMove = false;
    #   };
    # };

    # lspkind = {
    #   enable = true;
    #
    #   cmp = {
    #     enable = true;
    #     menu = {
    #       nvim_lsp = "[LSP]";
    #       nvim_lua = "[api]";
    #       path = "[path]";
    #       luasnip = "[snip]";
    #       buffer = "[buffer]";
    #       neorg = "[neorg]";
    #       cmp_tabby = "[Tabby]";
    #     };
    #   };
    # };

    lsp = {
      enable = true;

      servers = {
        bashls.enable = true;
        clangd.enable = true;
        cmake.enable = true;
        csharp_ls.enable = true;
        docker_compose_language_service.enable = true;
        dockerls.enable = true;
        eslint.enable = true;
        gopls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        lua_ls.enable = true;
        marksman.enable = true;
        nil_ls.enable = true;
        prismals.enable = true;
        prismals.package = null;
        pyright.enable = true;
        svelte.enable = true;
        tailwindcss.enable = true;
        ts_ls.enable = true;

        nixd = {
          enable = true;
          settings = {
            formatting.command = ["nixpkgs-fmt"];
          };
        };
        yamlls = {
          enable = true;
          extraOptions = {
            settings = {
              yaml = {
                schemas = {
                  kubernetes = "'*.yaml";
                  "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
                  "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
                  "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" = "*docker-compose*.{yml,yaml}";
                };
              };
            };
          };
        };
      };
    };

    lsp-lines = {
      enable = true;
    };
  };
}
