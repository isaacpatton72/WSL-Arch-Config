-- MUST be set before loading plugins
vim.g.mapleader = " "

-- Find all .lua files under lua/config/
for _, file in ipairs(vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/config", "**/*.lua", false, true)) do
  -- Extract module path relative to 'lua/'
  local mod = file:match(".*/lua/(.*)%.lua$"):gsub("/", ".")
  if not mod:match("%.lazy$") and not mod:match("%.init$") then
    pcall(require, mod)
  end
end

-- Then load lazy last
require("config.lazy")

-- Lazy setup
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})
