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
          ensure_installed = { "lua", "python", "javascript", "typescript", "tsx", "markdown", "markdown_inline", "kotlin", "java", "html", "css", "json" },
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
        ensure_installed = { "ts_ls", "basedpyright", "ruff", "lua_ls", "kotlin_language_server", "jdtls", "html", "cssls", "jsonls" },
      })
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("basedpyright")
      vim.lsp.enable("ruff")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("kotlin_language_server")
      vim.lsp.enable("jdtls")
      vim.lsp.enable("html")
      vim.lsp.enable("cssls")
      vim.lsp.enable("jsonls")
    end,
  },

  -- 6. Completion
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })

      -- Use buffer source for `/` and `?`
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })

      -- Use cmdline & path source for ':'
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
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
        java = { "google-java-format" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
      },
      format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
    },
  },

  -- 8. Quality of Life
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  { "windwp/nvim-ts-autotag", ft = { "html", "javascript", "typescript", "tsx" }, opts = {} },

  -- 9. Which-key (Đã cấu hình tên nhóm rõ ràng)
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

  -- 9. Terminal & Code Runner
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<c-\>]], -- Ctrl + \ để mở terminal
      direction = "float",      -- Mở terminal dạng nổi
      float_opts = { border = "curved" },
    },
  },
  {
    "CRAG666/code_runner.nvim",
    opts = {
      filetype = {
        python = "python3 -u",
        java = {
          "cd $dir &&",
          "javac $fileName &&",
          "java $fileNameWithoutExt",
        },
        kotlin = {
          "cd $dir &&",
          "kotlinc $fileName -include-runtime -d $fileNameWithoutExt.jar &&",
          "java -jar $fileNameWithoutExt.jar",
        },
        javascript = "node",
        typescript = "ts-node",
      },
    },
  },

  -- 10. Which-key (Cấu hình phím tắt)
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
          { "<leader>r", group = "Run/Compile", icon = "󰐊 " },
          { "<leader>rr", "<cmd>RunCode<cr>", desc = "Run File" },
          { "<leader>rf", "<cmd>RunFile<cr>", desc = "Run File (Buffer)" },
          { "<leader>rt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
        },
      })
    end,
  },

  -- 11. Others
  { "lewis6991/gitsigns.nvim", opts = {} },
  { "mrjones2014/smart-splits.nvim", opts = {} },
}
