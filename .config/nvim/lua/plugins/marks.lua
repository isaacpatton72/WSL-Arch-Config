return {
  "chentoast/marks.nvim",
  event = "VeryLazy",

  opts = {
    default_mappings = true,

    -- Optional automatic Vim marks to display
    builtin_marks = {
      ".",
      "<",
      ">",
      "^",
    },

    cyclic = true,
    force_write_shada = true,
    refresh_interval = 250,
    signs = true,

    sign_priority = {
      lower = 10,
      upper = 15,
      builtin = 8,
      bookmark = 20,
    },

    excluded_filetypes = {},
    excluded_buftypes = {},
  },
}
