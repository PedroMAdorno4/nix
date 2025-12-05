{
  programs.nixvim.extraConfigLua = ''
    require("supermaven-nvim").setup({})

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

    -- Function to find Godot project root directory
    local function find_godot_project_root()
        local cwd = vim.fn.getcwd()
        local search_paths = { ''', '/..' }

      for _, relative_path in ipairs(search_paths) do
      local project_file = cwd .. relative_path .. '/project.godot'
      if vim.uv.fs_stat(project_file) then
      return cwd .. relative_path
      end
      end

      return nil
      end

      -- Function to check if server is already running
      local function is_server_running(project_path)
      local server_pipe = project_path .. '/server.pipe'
      return vim.uv.fs_stat(server_pipe) ~= nil
      end

      -- Function to start Godot server if needed
      local function start_godot_server_if_needed()
      local godot_project_path = find_godot_project_root()

      if godot_project_path and not is_server_running(godot_project_path) then
      vim.fn.serverstart(godot_project_path .. '/server.pipe')
      return true
      end

      return false
      end

      -- Main execution
      start_godot_server_if_needed()
  '';
}

