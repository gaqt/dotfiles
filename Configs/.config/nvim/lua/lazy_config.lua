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
   -- { 'tpope/vim-surround' },
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
   -- { 'tpope/vim-fugitive' },
   {
      "NeogitOrg/neogit",
      dependencies = {
         "nvim-lua/plenary.nvim",  -- required
         "sindrets/diffview.nvim", -- optional - Diff integration

         -- Only one of these is needed.
         "nvim-telescope/telescope.nvim", -- optional
         -- "ibhagwan/fzf-lua",      -- optional
         -- "echasnovski/mini.pick", -- optional
      },
      config = true
   },
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
   {
      "tiagovla/tokyodark.nvim",
      lazy = false,
      priority = 1000,
      opts = {
         gamma = 1.0
      }
   },
   {
      "forest-nvim/sequoia.nvim",
      lazy = false,
      priority = 1000,
   },
   { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
   {
      'maxmx03/solarized.nvim',
      lazy = false,
      priority = 1000,
   },
   {
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
      config = true,
      opts =
      { contrast = "soft" }
   },
   { 'sainnhe/gruvbox-material' },
   { 'luisiacc/gruvbox-baby' },
   { "folke/tokyonight.nvim" },
   { 'maxmx03/fluoromachine.nvim' },
   { 'NLKNguyen/papercolor-theme' },
   { 'sainnhe/everforest' },
   {
      "scottmckendry/cyberdream.nvim",
      config = function()
         require('cyberdream').setup {
            transparent = false,
            italic_comments = true,
            saturation = 0.9,
            highlights = {
               Define = { fg = "#5ef1ff", italic = true },
               Keyword = { fg = "#ffbd5e", italic = true }
            }
         }
      end
   },
   { "rose-pine/neovim",        name = "rose-pine" },
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
   -- {
   --     'nvim-orgmode/orgmode',
   --     event = 'VeryLazy',
   --     ft = { 'org' },
   --     config = function()
   --         -- Setup orgmode
   --         require('orgmode').setup({
   --             org_agenda_files = '~/orgfiles/**/*',
   --             org_default_notes_file = '~/orgfiles/refile.org',
   --         })
   --     end,
   -- },
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
   -- { 'xiyaowong/transparent.nvim', lazy = false },
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
      'ggandor/leap.nvim',
      dependencies = { 'tpope/vim-repeat' },
      lazy = false,
   },
   { 'tpope/vim-sensible' },
   {
      'ggandor/flit.nvim',
      dependencies = { 'ggandor/leap.nvim' }
   },
   {
      'rasulomaroff/telepath.nvim',
      dependencies = 'ggandor/leap.nvim',
      -- there's no sence in using lazy loading since telepath won't load the main module
      -- until you actually use mappings
      lazy = false,
      config = function()
         require('telepath').use_default_mappings()
      end
   },
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
   { 'ThePrimeagen/vim-be-good' },
   { 'mfussenegger/nvim-dap' },
   -- {
   --    "m4xshen/hardtime.nvim",
   --    dependencies = { "MunifTanjim/nui.nvim" },
   --    opts = {}
   -- },
   -- { "potamides/pantran.nvim" }
   -- {
   --     "yetone/avante.nvim",
   --     event = "VeryLazy",
   --     version = false, -- Never set this value to "*"! Never!
   --     opts = {
   --         -- add any opts here
   --         -- for example
   --         provider = "openai",
   --         openai = {
   --             endpoint = "https://api.openai.com/v1",
   --             model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
   --             timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
   --             temperature = 0,
   --             max_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
   --             --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
   --         },
   --     },
   --     -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
   --     build = "make",
   --     -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
   --     dependencies = {
   --         "nvim-treesitter/nvim-treesitter",
   --         "stevearc/dressing.nvim",
   --         "nvim-lua/plenary.nvim",
   --         "MunifTanjim/nui.nvim",
   --         --- The below dependencies are optional,
   --         "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
   --         "hrsh7th/nvim-cmp",      -- autocompletion for avante commands and mentions
   --         "ibhagwan/fzf-lua",      -- for file_selector provider fzf
   --         "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
   --         "zbirenbaum/copilot.lua", -- for providers='copilot'
   --     },
   -- }
})
