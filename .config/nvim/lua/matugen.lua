local M = {}

function M.setup()
    require('base16-colorscheme').setup {
        -- Background tones
        base00 = '#1e1e2e',                -- Default Background
        base01 = '#313244',      -- Lighter Background
        base02 = '#3a3b50', -- Selection Background
        base03 = '#646789',                -- Comments, Invisibles
        
        -- Foreground tones
        base04 = '#a3b4eb',     -- Dark Foreground
        base05 = '#cdd6f4',             -- Default Foreground
        base06 = '#cdd6f4',             -- Light Foreground
        base07 = '#cdd6f4',          -- Lightest Foreground
        
        -- Accent colors
        base08 = '#f38ba8',                  -- Variables, Errors
        base09 = '#94e2d5',               -- Integers, Constants
        base0A = '#fab387',              -- Classes, Search
        base0B = '#cba6f7',                -- Strings
        base0C = '#96e9db',     -- Regex
        base0D = '#bb8af4',      -- Functions
        base0E = '#fab185',    -- Keywords
        base0F = '#c8043a',        -- Deprecated
    }

    -- Let terminal background show through (follows Kitty/Noctalia theme)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
end

-- Register a signal handler for SIGUSR1 (hot-reloading when Noctalia updates)
local signal = vim.uv.new_signal()
signal:start('sigusr1', vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
end))

return M
