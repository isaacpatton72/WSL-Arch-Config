return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>nt", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = "disabled",
    },
  },
}
