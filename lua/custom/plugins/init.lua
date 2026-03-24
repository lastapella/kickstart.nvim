-- You can add your own plugins here or in other files in this directory!init
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'ThePrimeagen/harpoon', branch = 'harpoon2', dependencies = { { 'nvim-lua/plenary.nvim' } } },
  { 'tpope/vim-fugitive' },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration
      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
      -- 'ibhagwan/fzf-lua', -- optional
    },
    config = true,
  },
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_proxy_strict_ssl = false
      vim.g.copilot_workspace_folders = { '~/workspace/krisplus' }
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
      --
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  -- {
  --   'folke/trouble.nvim',
  --   config = function()
  --     require('trouble').setup {
  --       icons = false,
  --     }
  --
  --     vim.keymap.set('n', '<leader>tt', function()
  --       require('trouble').toggle("lsp_document_symbols")
  --     end)
  --
  --     vim.keymap.set('n', '[t', function()
  --       require('trouble').next { skip_groups = true, jump = true }
  --     end)
  --
  --     vim.keymap.set('n', ']t', function()
  --       require('trouble').previous { skip_groups = true, jump = true }
  --     end)
  --   end,
  -- },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('trouble').setup {
        auto_open = false,
        auto_close = true,
      }
      vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle <CR>', { desc = 'Trouble Toggle' })
      vim.keymap.set('n', '<leader>xw', '<cmd>Trouble diagnostics toggle focus=false<CR> ', { desc = 'Trouble workspace diagnostics' })
      vim.keymap.set('n', '<leader>xd', '<cmd>Trouble diagnostics toggle focus=false filter.buf=0<CR>', { desc = 'Trouble document diagnostics' })
      vim.keymap.set('n', '<leader>xj', function()
        require('trouble').next { skip_groups = true, jump = true }
      end, { desc = 'Trouble Next' })
      vim.keymap.set('n', '<leader>xk', function()
        require('trouble').prev { skip_groups = true, jump = true }
      end, { desc = 'Trouble Previous' })
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },

    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback

      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup {
        routes = {
          {
            filter = {
              event = 'msg_show',
              kind = 'search_count',
            },
            opts = { skip = true },
          },
          {
            view = 'split',
            filter = { event = 'msg_show', min_height = 20 },
          },
          {
            view = 'popup',
            filter = { event = 'msg_show', kind = 'confirm' },
          },
        },
        -- lsp = {
        --   -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        --   override = {
        --     ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        --     ['vim.lsp.util.stylize_markdown'] = true,
        --     ['cmp.entry.get_documentation'] = true,
        --   },
        -- },
        messages = {
          enabled = false,
          view_search = false,
        },
        -- you can enable a preset for easier configuration
        presets = {

          -- command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true,
        },
      }
    end,
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'folke/noice.nvim',
      'folke/tokyonight.nvim',
    },
    -- See `:help lualine.txt`
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          -- theme = 'OceanicNext',
          -- theme = 'material',
          -- theme = 'ayu_mirage',
          -- theme = 'auto',
					-- theme = 'tokyonight'
          -- theme = 'palenight',
          -- component_separators = '|',
          -- section_separators = '',
        },
        sections = {
          lualine_b = {
            'branch',
            'diff',
            'diagnostics',
            -- {
            --   function()
            --     return string.gsub(vim.fn.getcwd(), os.getenv 'HOME', '~')
            --   end,
            -- },
          },
          lualine_c = {
            { 'filename', path = 1 },
            {
              require('noice').api.status.search.get,
              cond = require('noice').api.status.search.has,
              -- color = { 'lualine_c_normal' },
            },
          },
          lualine_x = {
            {
              require('noice').api.statusline.mode.get,
              cond = require('noice').api.statusline.mode.has,
              color = { fg = '#ff9e64' },
            },
            -- {
            --   require('noice').api.status.message.get_hl,
            --   cond = require('noice').api.status.message.has,
            -- },
            {
              require('noice').api.status.command.get,
              cond = require('noice').api.status.command.has,
              color = { fg = '#ff9e64' },
            },
            'encoding',
            'fileformat',
            'filetype',
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        tabline = {
          lualine_a = {
            { 'buffers', use_mode_colors = true, max_length = vim.o.columns * 2 / 3 },
          },
          lualine_z = { { 'tabs', mode = 2 } },
        },
      }
    end,
  },
  -- {
  --   'ThePrimeagen/git-worktree.nvim',
  --   dependencies = {
  --     'nvim-telescope/telescope.nvim',
  --   },
  --   config = function()
  --     require('telescope').load_extension 'git_worktree'
  --     vim.keymap.set('n', '<leader>gw', function()
  --       require('telescope').extensions.git_worktree.git_worktrees()
  --     end, { noremap = true, silent = true, desc = 'Switch Git Worktree' })
  --     vim.keymap.set('n', '<leader>gc', function()
  --       require('telescope').extensions.git_worktree.create_git_worktree()
  --     end, { noremap = true, silent = true, desc = 'Create Git Worktree' })
  --   end,
  -- },
  -- {
  --   'mhartington/formatter.nvim',
  --   config = function()
  --     require('formatter').setup {
  --       filetype = {
  --         lua = { require('formatter.filetypes.lua').stylua },
  --         typescript = { require('formatter.filetypes.typescript').prettier },
  --         javascript = { require('formatter.filetypes.javascript').prettier },
  --         json = { require('formatter.filetypes.json').fixjson },
  --         ['*'] = {
  --           require('formatter.filetypes.any').remove_trailing_whitespace,
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    'LukasPietzschmann/telescope-tabs',
    config = function()
      require('telescope').load_extension 'telescope-tabs'
      require('telescope-tabs').setup {}
      vim.keymap.set('n', '<leader>st', function()
        require('telescope-tabs').list_tabs()
      end, { desc = 'Telescope list tabs' })
    end,
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  -- {
  --   'nvim-telescope/telescope.nvim',
  --   dependencies = {
  --     {
  --       'nvim-telescope/telescope-live-grep-args.nvim',
  --       -- This will not install any breaking changes.
  --       -- For major updates, this must be adjusted manually.
  --       version = '^1.0.0',
  --     },
  --   },
  --   config = function()
  --     require('telescope').load_extension 'live_grep_args'
  --   end,
  -- },
  {
    'sindrets/diffview.nvim',
    config = function()
      require('diffview').setup {
        enhanced_diff_hl = true,
        -- keymaps = {
        --   file_panel = {
        --     { 'n', '<c-b>', false },
        --     { 'n', '<c-f>', false },
        --   },
        --   file_history_panel = {
        --     { 'n', '<c-b>', false },
        --     { 'n', '<c-f>', false },
        --   },
        -- },
      }
    end,
  },
  -- {
  --   'sunjon/shade.nvim',
  --   config = function()
  --     require('shade').setup {
  --       overlay_opacity = 65,
  --       opacity_step = 1,
  --     }
  --   end,
  -- },
  -- { 'RRethy/vim-illuminate' },
  { 'nvim-pack/nvim-spectre', config = function() end },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_WindowLayout = 4
    end,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
    config = function()
      require('oil').setup {
        default_file_explorer = false,
        keymaps = {
          ['<C-s>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
          ['<C-h>'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the entry in a horizontal split' },
          ['<C-t>'] = { 'actions.select', opts = { tab = true }, desc = 'Open the entry in new tab' },
          ['<C-p>'] = 'actions.preview',
          ['<C-c>'] = 'actions.close',
          ['<C-l>'] = 'actions.refresh',
        },
      }
    end,
  },
  -- Buggy with other plugins
  -- { 'akinsho/toggleterm.nvim', version = '*', config = true },
}
