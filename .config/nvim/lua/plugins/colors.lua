return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        transparent_background = true,
      })

      vim.cmd.colorscheme("catppuccin")

      -- Additional transparent UI elements
      local transparent_groups = {
        "Normal",
        "NormalNC",
        "SignColumn",
        "EndOfBuffer",
      }

      for _, group in ipairs(transparent_groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
      end
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
  },
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = true,
  },
}
