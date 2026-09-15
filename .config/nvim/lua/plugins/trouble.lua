return {
  {
    "folke/trouble.nvim",
    opts = {},

    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<CR>",
        desc = "Diagnostics",
      },
      {
        "<leader>xr",
        "<cmd>Trouble lsp_references toggle<CR>",
        desc = "References",
      },
    },
  },
}
