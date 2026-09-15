return {
  "kelly-lin/ranger.nvim",
  lazy = false,
  opts = {
    replace_netrw = false, -- Disable built-in immediate hijack to prevent geometry race
  },
  config = function(_, opts)
    local ranger = require("ranger-nvim")
    ranger.setup(opts)

    -- Normal mapping
    vim.keymap.set("n", "<leader>ef", function()
      ranger.open(true)
    end, { desc = "Open Ranger" })

    -- Clean startup hijack for 'nvim .' or any directory argument
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local path = vim.fn.argv(0)
        if path and vim.fn.isdirectory(path) == 1 then
          -- Wipe the directory buffer so an empty buffer doesn't hang behind Ranger
          local dir_buf = vim.api.nvim_get_current_buf()
          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(dir_buf) then
              pcall(vim.api.nvim_buf_delete, dir_buf, { force = true })
            end
            ranger.open(true)
          end)
        end
      end,
    })
  end,
}
