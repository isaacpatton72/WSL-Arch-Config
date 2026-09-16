local is_linux = (jit.os == "Linux")

if not is_linux then
  -- Return disabled spec on Windows/other OS
  return {
    "kelly-lin/ranger.nvim",
    enabled = false,
  }
end

-- Completely disable built-in netrw so it never renders or creates buffers
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  "kelly-lin/ranger.nvim",
  enabled = true,
  lazy = false,
  opts = {
    replace_netrw = false,
  },
  config = function(_, opts)
    local ranger = require("ranger-nvim")
    ranger.setup(opts)

    -- Normal mapping inside files
    vim.keymap.set("n", "<leader>ef", function()
      ranger.open(true)
    end, { desc = "Open Ranger" })

    -- Clean startup hijack without netrw flashing or leftover buffers
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local arg = vim.fn.argv(0)
        if arg and vim.fn.isdirectory(arg) == 1 then
          local dir_buf = vim.api.nvim_get_current_buf()

          -- Create an unlisted scratch buffer to hold the window cleanly
          local scratch_buf = vim.api.nvim_create_buf(false, true)
          vim.api.nvim_set_current_buf(scratch_buf)

          -- Delete the original directory buffer so it doesn't linger
          if vim.api.nvim_buf_is_valid(dir_buf) then
            pcall(vim.api.nvim_buf_delete, dir_buf, { force = true })
          end

          -- Launch Ranger once window layout settles
          vim.schedule(function()
            ranger.open(true)
          end)
        end
      end,
    })
  end,
}
