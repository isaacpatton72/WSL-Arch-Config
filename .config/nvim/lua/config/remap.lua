vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ef", vim.cmd.Ex)

-- exit terminal keymap
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]])

-- new split terminal
vim.keymap.set("n", "<leader>spt", function()
  vim.cmd("botright split | resize 15 | terminal")
  vim.cmd("startinsert")
end, { desc = "Open terminal split" })

-- discard changes with confirmation
vim.keymap.set("n", "<leader>dc", function()
  local confirm = vim.fn.confirm(
    "Discard unsaved changes and reload file?",
    "&Yes\n&No",
    2
  )

  if confirm == 1 then
    vim.cmd("edit!")
  end
end, {
  desc = "Discard changes and reload file",
})

-- clipboard yank

vim.opt.clipboard = "unnamedplus"

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end

-- movement wrap
vim.opt.whichwrap:append("<,>,h,l,[,]")

-- backspace in visual mode deletes selection without yanking
vim.keymap.set("x", "<BS>", '"_d', {
  desc = "Delete selection without yanking",
})

-- edit neovim config
vim.keymap.set("n", "<leader>ec", function()
  vim.cmd("tabedit " .. vim.fn.fnameescape(vim.fn.stdpath("config")))
end, {
  desc = "Edit Neovim config directory",
})

-- tab remaps
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", {
  desc = "New tab",
})

vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", {
  desc = "Close tab",
})

vim.keymap.set("n", "<leader>tl", "<cmd>tabnext<CR>", {
  desc = "Next tab",
})

vim.keymap.set("n", "<leader>th", "<cmd>tabprevious<CR>", {
  desc = "Previous tab",
})

vim.keymap.set("n", "<leader>ti", function()
  vim.cmd("startinsert")
end, {
  desc = "Refocus terminal",
})

-- Move selected line / block of lines down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

-- Move selected line / block of lines up
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep visual selection after shifting left or right
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

require("config.keymaps.split")
