return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    keys = {
      -- Files
      { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find files" },
      { "<leader>fg", function() require("fzf-lua").git_files() end, desc = "Find Git files" },
      { "<leader>fs", function() require("fzf-lua").live_grep() end, desc = "Search text" },
      { "<leader>fw", function() require("fzf-lua").grep_cword() end, desc = "Search word" },
      { "<leader>fr", function() require("fzf-lua").oldfiles() end, desc = "Recent files" },
      { "<leader>fb", function() require("fzf-lua").buffers() end, desc = "Buffers" },
      { "<leader>fh", function() require("fzf-lua").help_tags() end, desc = "Help" },
      { "<leader>f.", function() require("fzf-lua").resume() end, desc = "Resume last search" },

      -- Diagnostics
      { "<leader>fd", function() require("fzf-lua").diagnostics_document() end, desc = "Document Diagnostics" },
      { "<leader>fD", function() require("fzf-lua").diagnostics_workspace() end, desc = "Workspace Diagnostics" },

      -- Symbols
      { "<leader>fy", function() require("fzf-lua").lsp_document_symbols() end, desc = "Document Symbols" },
      { "<leader>fY", function() require("fzf-lua").lsp_workspace_symbols() end, desc = "Workspace Symbols" },

      -- Utility
      { "<leader>fc", function() require("fzf-lua").commands() end, desc = "Commands" },
      { "<leader>fk", function() require("fzf-lua").keymaps() end, desc = "Keymaps" },
      { "<leader>fj", function() require("fzf-lua").jumps() end, desc = "Jump List" },
      { "<leader>fm", function() require("fzf-lua").marks() end, desc = "Marks" },

      -- LSP Navigation
      { "gD", function() require("fzf-lua").lsp_definitions() end, desc = "Goto definition" },
      { "gr", function() require("fzf-lua").lsp_references() end, desc = "Goto references" },
      { "gI", function() require("fzf-lua").lsp_implementations() end, desc = "Goto implementation" },
      { "gt", function() require("fzf-lua").lsp_typedefs() end, desc = "Goto type definition" },
    },

    opts = {
      grep = {
        rg_glob = true,
      },

      live_grep = {
        multiprocess = true,
      }
    }
  }
}
