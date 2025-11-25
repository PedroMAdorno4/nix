{ lib, ... }:
{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = false;

      settings = {
        auto_install = true;
        highlight = {
          additional_vim_regex_highlighting = true;
          custom_captures = { };
          enable = true;
          disable = ''
            function(lang, bufnr) -- Disable in large buffers
              return vim.api.nvim_buf_line_count(bufnr) > 10000
            end'';
        };

        indent = {
          enable = true;
        };
      };
    };

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

      keymaps = {
        # diagnostic = {
        #   "]d" = "goto_next";
        #   "[d" = "goto_prev";
        #   "<leader>ld" = "open_float";
        # };

        lspBuf = {
          # K = "hover";
          # H = "signature_help";
          "<leader>lf" = "format";
          # "<leader>lf" = ":lua require('conform').format({ async = true })<CR>";
          # "<leader>la" = "code_action";
          # "gr" = "references";
          # "gd" = "definition";
          # "gi" = "implementation";
          # "gt" = "type_definition";
        };
      };

      servers = {
        bashls.enable = true;
        clangd.enable = true;
        # cmake.enable = true;
        csharp_ls.enable = true;
        docker_compose_language_service.enable = true;
        dockerls.enable = true;
        eslint.enable = true;
        gitlab_ci_ls.enable = true;
        gdscript = {
          enable = true;
          package = null;
          settings = {
            host = "127.0.0.1";
            port = 6005;
          };
        };
        gdshader_lsp = {
          enable = true;
          package = null;
        };
        gopls = {
          enable = true;
          settings = {
            gopls = {
              env = {
                "CGO_ENABLED" = 1;
                "LD_LIBRARY_PATH" = "~/pjx/tropico-lbs/internal/protocols/rppa/codec/";
              };
              completeUnimported = true;
              staticcheck = true;
              analyses = {
                unusedparams = true;
              };
            };

          };
        };
        html.enable = true;
        jsonls.enable = true;
        lua_ls.enable = true;
        marksman.enable = true;
        postgres_lsp.enable = true;
        prismals.enable = true;
        prismals.package = null;
        pylsp.enable = true;
        svelte.enable = true;
        tailwindcss.enable = true;
        tinymist.enable = true;
        ts_ls.enable = true;
        # dartls.enable = true;

        openscad_lsp = {
          enable = true;
          autostart = true;
        };

        nixd = {
          enable = true;
          settings = {
            formatting.command = [ "nixpkgs-fmt" ];
            autoArchive = true;
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
                  "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" =
                    "*docker-compose*.{yml,yaml}";
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
