return {
  -- 1. Colorscheme
  {
    "RRethy/base16-nvim",
    priority = 1000,
    config = function()
      local ok, matugen = pcall(require, "matugen")
      if ok then matugen.setup() end
    end,
  },

  -- 2. Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    },
    opts = {
      filesystem = {
        filtered_items = { visible = true, hide_dotfiles = false },
        follow_current_file = { enabled = true },
      },
    },
  },

  -- 3. Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
  },

  -- 4. Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    priority = 1000,
    config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if ok then
        configs.setup({
          ensure_installed = { "lua", "python", "javascript", "typescript", "tsx", "markdown", "markdown_inline" },
          highlight = { enable = true },
          indent = { enable = true },
        })
      end
    end,
  },

  -- 5. LSP & Mason
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "basedpyright", "ruff", "lua_ls" },
      })
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("basedpyright")
      vim.lsp.enable("ruff")
      vim.lsp.enable("lua_ls")
    end,
  },

  -- 6. Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path" },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "buffer" }, { name = "path" } }),
      })
    end,
  },

  -- 7. Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
      },
      format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
    },
  },

  -- 8. Which-key (Đã cấu hình tên nhóm rõ ràng)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        spec = {
          { "<leader>f", group = "Find/Files", icon = "󰈞 " },
          { "<leader>s", group = "Splits/Windows", icon = " " },
          { "<leader>n", group = "No Highlight", icon = "󰈔 " },
          { "<leader>c", group = "Code/Format", icon = "󰅱 " },
          { "<leader>g", group = "Git", icon = "󰊢 " },
        },
      })
    end,
  },

  -- 9. Others
  { "lewis6991/gitsigns.nvim", opts = {} },
  { "mrjones2014/smart-splits.nvim", opts = {} },
}
