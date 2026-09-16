local is_linux = (jit.os == "Linux")

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  -- On Windows, load at startup so it intercepts 'nvim .'
  lazy = is_linux,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>nt", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
    -- Fallback mapping for Windows if you still hit <leader>ef
    {
      "<leader>ef",
      function()
        if not is_linux then
          vim.cmd("Neotree toggle")
        end
      end,
      desc = "Open Explorer",
    },
  },
  opts = {
    filesystem = {
      -- Ranger handles directories on Linux; Neo-tree handles them on Windows
      hijack_netrw_behavior = is_linux and "disabled" or "open_default",
      use_libuv_file_watcher = true,
    },
  },
}
