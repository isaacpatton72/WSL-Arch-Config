return {
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },

    opts = {},

    keys = {
      {
        "K",
        "<cmd>Lspsaga hover_doc<CR>",
        desc = "Hover Documentation",
      },
      {
        "gd",
        "<cmd>Lspsaga peek_definition<CR>",
        desc = "Peek Definition",
      },
      {
        "<leader>rn",
        "<cmd>Lspsaga rename<CR>",
        desc = "Rename Symbol",
      },
      {
        "<leader>ca",
        "<cmd>Lspsaga code_action<CR>",
        desc = "Code Action",
      },
    },
  }
}
