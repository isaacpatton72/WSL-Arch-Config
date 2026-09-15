return {
  {
    "mason-org/mason-lspconfig.nvim",

    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {},
      },
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
        },
        automatic_enable = false,
      })

      local capabilities =
        require("cmp_nvim_lsp").default_capabilities()

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Keymaps available whenever an LSP attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup(
          "UserLspKeymaps",
          { clear = true }
        ),

        callback = function(event)
          local function map(keys, action, description)
            vim.keymap.set("n", keys, action, {
              buffer = event.buf,
              silent = true,
              desc = description,
            })
          end
        end
      })
    end
  }
}
