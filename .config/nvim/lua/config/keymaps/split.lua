-- Ensure splits open in predictable directions
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Create and manage splits
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", {
  desc = "Split vertically",
})

vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", {
  desc = "Split horizontally",
})

vim.keymap.set("n", "<leader>sc", "<cmd>close<CR>", {
  desc = "Close split",
})

vim.keymap.set("n", "<leader>se", "<C-w>=", {
  desc = "Equalize splits",
})

-- Navigate between splits
vim.keymap.set("n", "<C-h>", "<C-w>h", {
  desc = "Focus left split",
})

vim.keymap.set("n", "<C-j>", "<C-w>j", {
  desc = "Focus lower split",
})

vim.keymap.set("n", "<C-k>", "<C-w>k", {
  desc = "Focus upper split",
})

vim.keymap.set("n", "<C-l>", "<C-w>l", {
  desc = "Focus right split",
})

-- Resize splits
vim.keymap.set("n", "<A-h>", "<cmd>vertical resize -2<CR>", {
  desc = "Shrink split horizontally",
})

vim.keymap.set("n", "<A-l>", "<cmd>vertical resize +2<CR>", {
  desc = "Grow split horizontally",
})

vim.keymap.set("n", "<A-j>", "<cmd>resize +2<CR>", {
  desc = "Grow split vertically",
})

vim.keymap.set("n", "<A-k>", "<cmd>resize -2<CR>", {
  desc = "Shrink split vertically",
})
