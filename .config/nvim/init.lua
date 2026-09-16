-- MUST be set before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Normalize paths across Linux/WSL and Windows
local config_path = vim.fs.normalize(vim.fn.stdpath("config") .. "/lua/config")

for _, file in ipairs(vim.fn.globpath(config_path, "**/*.lua", false, true)) do
  -- Normalize backslashes to forward slashes for Windows compatibility
  local normalized = vim.fs.normalize(file)
  local mod = normalized:match(".*/lua/(.*)%.lua$")

  if mod then
    mod = mod:gsub("/", ".")
    if not mod:match("%.lazy$") and not mod:match("%.init$") then
      pcall(require, mod)
    end
  end
end

-- Load your lazy config
require("config.lazy")
