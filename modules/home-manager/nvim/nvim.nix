{
  inputs,
  pkgs,
  ...
}: {
	home.packages = with pkgs; [
			lua-language-server
			typescript-language-server
			rust-analyzer
			pylyzer
			vscode-langservers-extracted
			bash-language-server
			nixd
	];
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

    extraLuaConfig = ''
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.signcolumn = "yes"
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.swapfile = false
      vim.opt.winborder = "rounded"
      vim.opt.cursorline = true
      vim.g.mapleader = " "

			vim.opt.clipboard = "unnamedplus"
			vim.g.clipboard = {
				name = "wl-clipboard",
				copy = {
					["+"] = "wl-copy --foreground --type text/plain",
					["*"] = "wl-copy --foreground --primary --type text/plain",
				},
				paste = {
					["+"] = "wl-paste --no-newline",
					["*"] = "wl-paste --no-newline --primary",
				},
				cache_enabled = true,
			}

      vim.pack.add({
        { src = "https://github.com/folke/tokyonight.nvim" },
        { src = "https://github.com/stevearc/oil.nvim" },
        { src = "https://github.com/echasnovski/mini.pick" },
        { src = "https://github.com/neovim/nvim-lspconfig" },
        { src = "https://github.com/supermaven-inc/supermaven-nvim" },
      })

      require("mini.pick").setup()

			-- OIL CONFIG
			function _G.get_oil_winbar()
				local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
				local dir = require("oil").get_current_dir(bufnr)
				if dir then
					return vim.fn.fnamemodify(dir, ":~")
				else
					-- If there is no current directory (e.g. over ssh), just show the buffer name
					return vim.api.nvim_buf_get_name(0)
				end
			end

			local detail = false
			require("oil").setup({
				win_options = {
					winbar = "%!v:lua.get_oil_winbar()",
				},
				keymaps = {
					["gd"] = {
						desc = "Toggle file detail view",
						callback = function()
							detail = not detail
							if detail then
								require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
							else
								require("oil").set_columns({ "icon" })
							end
						end,
					},
				},
			})
			-- END OIL CONFIG

      vim.lsp.enable({ "lua_ls", "tsserver", "rust_analyzer", "pylyzer", "jsonls", "bashls", "nixd" })
			require("supermaven-nvim").setup({})
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				dim_inactive = true,
			})

      -- vim.cmd(":hi statusline guibg=NONE")
			vim.cmd("colorscheme tokyonight")
      vim.cmd("set completeopt+=noselect")

      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
      vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")
      vim.keymap.set("n", "<leader>fw", ":Pick grep_live<CR>")
      vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
      vim.keymap.set("n", "<leader>e", ":Oil<CR>")

			vim.keymap.set('i', '<cr>', function()
				return vim.fn.pumvisible() == 1 and '<c-y>' or '<cr>'
			end, { expr = true, noremap = true })

			vim.keymap.set('i', '<c-space>', function()
				vim.lsp.completion.get()
			end)

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if client:supports_method('textDocument/completion') then
						vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true})
					end
				end
			}) '';
  };
}
