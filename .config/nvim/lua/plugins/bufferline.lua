return {
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    
    keys = {
      { "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick buffer" },
      { "<leader>bc", "<cmd>bdelete<CR>", desc = "Close buffer" },
      {
        "<leader>bl",
        function()
          if vim.o.showtabline == 0 then
            vim.o.showtabline = 2
          else
            vim.o.showtabline = 0
          end
        end,
        desc = "Toggle Bufferline",
      },
    },

    opts = {
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        separator_style = "thin",
        always_show_bufferline = true,
      },
    },
  },
}
