-- ~/.config/nvim/init.lua

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load configurations
require("config.options")
require("config.keymaps")

-- Setup lazy.nvim and load plugins
require("lazy").setup("plugins")

-- Apply Noctalia/Matugen theme if available
pcall(function()
  require("matugen").setup()
end)

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end

local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end
