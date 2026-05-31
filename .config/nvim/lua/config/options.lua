-- ~/.config/nvim/lua/config/options.lua

local opt = vim.opt

opt.number = true           -- Show line numbers
opt.relativenumber = true   -- Relative line numbers
opt.shiftwidth = 4          -- Size of an indent
opt.tabstop = 4             -- Number of spaces tabs count for
opt.expandtab = true        -- Use spaces instead of tabs
opt.smartindent = true      -- Insert indents automatically
opt.wrap = false            -- Disable line wrap
opt.termguicolors = true    -- True color support
opt.cursorline = true       -- Highlight the current line
opt.ignorecase = true       -- Ignore case in search patterns
opt.smartcase = true        -- Smart case matching
opt.scrolloff = 8           -- Keep at least 8 lines above/below cursor
opt.updatetime = 50         -- Faster completion
opt.timeoutlen = 300        -- Faster keymap/which-key response
opt.mouse = "a"             -- Enable mouse support

-- Custom minimalist statusline
function _G.simple_statusline()
  local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":~") -- Get CWD with ~ for home
  return table.concat({
    " %f",                   -- File path
    " %m%r%h%w",             -- Flags (modified, readonly, etc)
    "%=",                    -- Right align separator
    "[" .. cwd .. "]",       -- Current Working Directory
    " %y ",                  -- FileType
    "%l:%c ",                -- Line:Column
    "%p%% ",                 -- Percentage
  })
end

opt.statusline = "%!v:lua.simple_statusline()"
