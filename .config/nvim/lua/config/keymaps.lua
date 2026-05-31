local keymap = vim.keymap

-- Set leader key to space
vim.g.mapleader = " "

-- File Explorer (Neo-tree)
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })

-- Basic keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Formatting (Manual)
keymap.set("n", "<leader>cf", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format file" })

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Resize with arrows (Using smart-splits)
keymap.set("n", "<A-h>", function() require("smart-splits").resize_left() end, { desc = "Resize Left" })
keymap.set("n", "<A-j>", function() require("smart-splits").resize_down() end, { desc = "Resize Down" })
keymap.set("n", "<A-k>", function() require("smart-splits").resize_up() end, { desc = "Resize Up" })
keymap.set("n", "<A-l>", function() require("smart-splits").resize_right() end, { desc = "Resize Right" })

-- Better splits (Inherit current directory)
keymap.set("n", "<leader>sv", "<cmd>vsplit | lcd %:p:h<cr>", { desc = "Split Vertical" })
keymap.set("n", "<leader>sh", "<cmd>split | lcd %:p:h<cr>", { desc = "Split Horizontal" })

-- Terminal mode exit
keymap.set("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Buffer management (under leader f group)
keymap.set("n", "<leader>fd", "<cmd>bdelete<cr>", { desc = "Delete current buffer" })
keymap.set("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy find in current file" })
