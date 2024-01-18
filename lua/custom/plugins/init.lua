-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'ThePrimeagen/harpoon', branch = 'harpoon2', dependencies = { { 'nvim-lua/plenary.nvim' } } },
  { 'tpope/vim-surround' },
  { 'github/copilot.vim' },
  {
    'voldikss/vim-floaterm',
  },
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
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
        },
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
          theme = 'oneDark',
          -- theme = 'auto',
          -- component_separators = '|',
          -- section_separators = '',
        },
        sections = {
          lualine_b = {
            'branch',
            'diff',
            'diagnostics',
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
            'encoding',
            'fileformat',
            'filetype',
            {
              require('noice').api.status.message.get_hl,
              cond = require('noice').api.status.message.has,
            },
            {
              require('noice').api.status.command.get,
              cond = require('noice').api.status.command.has,
              color = { fg = '#ff9e64' },
            },
          },
        },
        tabline = {
          lualine_a = { 'buffers' },
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
          -- javascript = {
          --     function(parser)
          --     local util = require "formatter.util"
          --       if not parser then
          --         return {
          --           exe = "prettier",
          --           args = {
          --             "--stdin-filepath",
          --             util.escape_path(util.get_current_buffer_file_path()),
          --           },
          --           stdin = true,
          --           try_node_modules = true,
          --         }
          --       end
          --
          --       return {
          --         exe = "prettier",
          --         args = {
          --           "--stdin-filepath",
          --           util.escape_path(util.get_current_buffer_file_path()),
          --           "--parser",
          --           parser,
          --         },
          --         stdin = true,
          --         try_node_modules = true,
          --       }
          --     end
          -- }
        },
      }
    end,
  },
}
