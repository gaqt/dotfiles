local lazy = {}

function lazy.install(path)
   if vim.loop.fs_stat(path) then
      return
   end

   print('Installing lazy.nvim....')
   vim.fn.system({
      'git', 'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
   })
end

function lazy.setup(plugins)
   if vim.g.plugins_ready then
      return
   end

   -- You can "comment out" the line below after lazy.nvim is installed
   lazy.install(lazy.path)

   vim.opt.rtp:prepend(lazy.path)

   require('lazy').setup(plugins, lazy.opts)
   vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
   { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
   { 'nvim-lualine/lualine.nvim' },
   {
      'numToStr/Comment.nvim',
      config = function()
         require("Comment").setup()
      end
   },
   {
      "kylechui/nvim-surround",
      version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
         require("nvim-surround").setup({
            keymaps = {
               visual = "<C-s>",
               visual_line = "g<C-s>"
            }
         })
      end
   },
   {
      'stevearc/oil.nvim',
      opts = {},
      -- Optional dependencies
      -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
      dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
      -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
      lazy = false,
   },
   { 'nvim-tree/nvim-web-devicons' },
   { 'nvim-lua/plenary.nvim' },
   { 'nvim-telescope/telescope.nvim' },
   { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
   { 'tpope/vim-fugitive' },
   {
      'lewis6991/gitsigns.nvim',
      config = function()
         require('gitsigns').setup({
            current_line_blame = true,
            signs = {
               add = { text = '+' },
               change = { text = '|' },
               delete = { text = '‾' },
               topdelete = { text = '_' },
               changedelete = { text = '~' },
               untracked = { text = "%" }
            }
         })
      end
   },
   { 'editorconfig/editorconfig-vim' },
   { 'moll/vim-bbye' },
   { 'hrsh7th/nvim-cmp' },
   { 'hrsh7th/cmp-buffer' },
   { 'saadparwaiz1/cmp_luasnip' },
   {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" }
   },
   { 'hrsh7th/cmp-nvim-lsp' },
   {
      'L3MON4D3/LuaSnip',
      dependencies = { "rafamadriz/friendly-snippets" },
   },
   { 'williamboman/mason.nvim' },
   { 'williamboman/mason-lspconfig.nvim' },
   { 'neovim/nvim-lspconfig' },
   { 'wakatime/vim-wakatime',            lazy = false },
   {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = function()
         require('nvim-autopairs').setup {}
      end
   },
   {
      "christoomey/vim-tmux-navigator",
      cmd = {
         "TmuxNavigateLeft",
         "TmuxNavigateDown",
         "TmuxNavigateUp",
         "TmuxNavigateRight",
         "TmuxNavigatePrevious",
      },
      keys = {
         { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
         { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
         { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
         { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
         { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
      },
      lazy = false,
   },
   {
      'goolord/alpha-nvim',
      dependencies = {
         'echasnovski/mini.icons',
         'nvim-lua/plenary.nvim'
      },
      config = function()
         require 'alpha'.setup(require 'alpha.themes.theta'.config)
      end
   },
   {
      'norcalli/nvim-colorizer.lua',
      config = function()
         require 'colorizer'.setup()
      end
   },
   { "EdenEast/nightfox.nvim" },
   { 'maxmx03/fluoromachine.nvim' },
   { 'sheerun/vim-polyglot' },
   { 'nyoom-engineering/oxocarbon.nvim' },
   { 'NLKNguyen/papercolor-theme' },
   { 'sainnhe/everforest' },
   { 'akinsho/bufferline.nvim', version = "*",     dependencies = 'nvim-tree/nvim-web-devicons' },
   {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
         vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
   },
   {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {},
      keys = {
         {
            "<leader>?",
            function()
               require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
         },
      },
   },
   {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
         {
            "<leader>XX",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
         },
         {
            "<leader>Xx",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
         },
         {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
         },
         {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
         },
         {
            "<leader>XL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
         },
         {
            "<leader>XQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
         },
      },
   },
   {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
         require('todo-comments').setup {}
      end
   },
   {
      "j-hui/fidget.nvim",
      config = function()
         require('fidget').setup {}
      end
   },
   {
      "smoka7/multicursors.nvim",
      event = "VeryLazy",
      dependencies = {
         'nvimtools/hydra.nvim',
      },
      opts = {},
      cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
      keys = {
         {
            mode = { 'v', 'n' },
            '<Leader>g',
            '<cmd>MCstart<cr>',
            desc =
            'Create a selection for selected text or word under the cursor',
         },
      },
   },
   {
      "zbirenbaum/copilot.lua",
      config = function()
         require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
         })
      end,
   },
   {
      "zbirenbaum/copilot-cmp",
      config = function()
         require("copilot_cmp").setup()
      end
   },
   {
      'nvim-pack/nvim-spectre',
      dependencies = { 'nvim-lua/plenary.nvim' }
   },
   { 'RRethy/vim-illuminate' },
   { 'jghauser/mkdir.nvim' },
   {
      "michaelb/sniprun",
      branch = "master",

      build = "sh install.sh",
      -- do 'sh install.sh 1' if you want to force compile locally
      -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

      config = function()
         require("sniprun").setup({})
      end,
   },
   {
     "folke/flash.nvim",
     event = "VeryLazy",
     opts = {},
     -- stylua: ignore
     keys = {
       { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
       { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
       { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
     },
   },
   { 'tpope/vim-sensible' },
   {
      'windwp/nvim-ts-autotag',
      lazy = false,
      config = function()
         require('nvim-ts-autotag').setup {}
      end
   },
   { 'tpope/vim-unimpaired' },
   {
      'debugloop/telescope-undo.nvim',
      config = function()
         require('telescope').load_extension('undo')
         vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
      end
   },
   { 'mfussenegger/nvim-dap' },
})
