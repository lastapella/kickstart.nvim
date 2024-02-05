-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'ThePrimeagen/harpoon', branch = 'harpoon2', dependencies = { { 'nvim-lua/plenary.nvim' } } },
  { 'tpope/vim-surround' },
  { 'github/copilot.vim' },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('trouble').setup {
        auto_open = false,
        auto_close = true,
      }
      vim.keymap.set('n', '<leader>xx', function()
        require('trouble').toggle()
      end, { desc = 'Trouble Toggle' })
      vim.keymap.set('n', '<leader>xw', function()
        require('trouble').toggle 'workspace_diagnostics'
      end, { desc = 'Trouble workspace diagnostics' })
      vim.keymap.set('n', '<leader>xd', function()
        require('trouble').toggle 'document_diagnostics'
      end, { desc = 'Trouble document diagnostics' })
      vim.keymap.set('n', '<leader>xj', function()
        require('trouble').next { skip_groups = true, jump = true }
      end, { desc = 'Trouble Next' })
      vim.keymap.set('n', '<leader>xk', function()
        require('trouble').previous { skip_groups = true, jump = true }
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
    },
    -- See `:help lualine.txt`
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          -- theme = 'OceanicNext',
          theme = 'material',
          -- theme = 'auto',
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
              color = { fg = '#ff9e64' },
            },
          },
          lualine_x = {
            {
              require('noice').api.statusline.mode.get,
              cond = require('noice').api.statusline.mode.has,
              color = { fg = '#ff9e64' },
            },
            {
              require('noice').api.status.message.get_hl,
              cond = require('noice').api.status.message.has,
            },
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
  {
    'ThePrimeagen/git-worktree.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension 'git_worktree'
      vim.keymap.set('n', '<leader>gw', function()
        require('telescope').extensions.git_worktree.git_worktrees()
      end, { noremap = true, silent = true, desc = 'Switch Git Worktree' })
      vim.keymap.set('n', '<leader>gc', function()
        require('telescope').extensions.git_worktree.create_git_worktree()
      end, { noremap = true, silent = true, desc = 'Create Git Worktree' })
    end,
  },
  {
    'mhartington/formatter.nvim',
    config = function()
      require('formatter').setup {
        filetype = {
          lua = { require('formatter.filetypes.lua').stylua },
          typescript = { require('formatter.filetypes.typescript').prettier },
          javascript = { require('formatter.filetypes.javascript').prettier },
          json = { require('formatter.filetypes.json').fixjson },
          ['*'] = {
            require('formatter.filetypes.any').remove_trailing_whitespace,
          },
        },
      }
    end,
  },
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
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      {
        'nvim-telescope/telescope-live-grep-args.nvim',
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = '^1.0.0',
      },
    },
    config = function()
      require('telescope').load_extension 'live_grep_args'
    end,
  },
  {
    'sindrets/diffview.nvim',
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
  { 'RRethy/vim-illuminate' },
  { 'nvim-pack/nvim-spectre', config = function() end },
  -- Buggy with other plugins
  -- { 'akinsho/toggleterm.nvim', version = '*', config = true },
}
