vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  callback = function()

    vim.opt.number = true
    vim.opt.relativenumber = true

    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
    vim.opt.expandtab = true

    --disable swap files
    vim.opt.swapfile = false
  end,
})

-- Enable persistent undo
vim.opt.undofile = true

-- Set undo directory
local undo_dir = vim.fn.stdpath("data") .. "/undo"
vim.fn.mkdir(undo_dir, "p")
vim.opt.undodir = undo_dir
