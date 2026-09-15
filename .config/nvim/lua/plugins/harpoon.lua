return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      -- Add current file
      vim.keymap.set("n", "<leader>a", mark.add_file, {
        desc = "Harpoon Add File",
      })

      -- Open Harpoon menu
      vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, {
        desc = "Harpoon Menu",
      })

      -- Jump to harpooned files
      vim.keymap.set("n", "<leader>1", function()
        ui.nav_file(1)
      end, { desc = "Harpoon File 1" })

      vim.keymap.set("n", "<leader>2", function()
        ui.nav_file(2)
      end, { desc = "Harpoon File 2" })

      vim.keymap.set("n", "<leader>3", function()
        ui.nav_file(3)
      end, { desc = "Harpoon File 3" })

      vim.keymap.set("n", "<leader>4", function()
        ui.nav_file(4)
      end, { desc = "Harpoon File 4" })

      -- Cycle through harpoon files
      vim.keymap.set("n", "<leader>hn", ui.nav_next, {
        desc = "Harpoon Next",
      })

      vim.keymap.set("n", "<leader>hp", ui.nav_prev, {
        desc = "Harpoon Previous",
      })
    end,
  }
}
