vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      sources = { 'filesystem', 'git_status', 'buffers', 'document_symbols' },
      source_selector = {
        winbar = true,
        sources = {
          {
            source = 'filesystem', -- string
            display_name = '󰉓 F', -- string | nil
          },
          {
            source = 'buffers', -- string
            display_name = '󰈚 B', -- string | nil
          },
          {
            source = 'git_status', -- string
            display_name = '󰊢 G',
          },
          { source = 'document_symbols', display_name = '󰑯 S' }, -- string | nil
        },
      },
      close_if_last_window = true,
      window = {
        position = 'current',
        mappings = {
          ['e'] = function()
            vim.api.nvim_exec('Neotree focus filesystem left', true)
          end,
          ['b'] = function()
            vim.api.nvim_exec('Neotree focus buffers left', true)
          end,
          ['g'] = function()
            vim.api.nvim_exec('Neotree focus git_status left', true)
          end,
          ['G'] = function()
            vim.api.nvim_exec('Neotree focus document_symbols left', true)
          end,
          ['M'] = function()
            vim.api.nvim_exec('Neotree focus toggle float', true)
          end,
          ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
          ['/'] = 'noop',
        },
        -- auto_expand_width = true,
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = {
          enabled = true,
        },
      },
    }
    vim.keymap.set('n', '<leader>xe', '<cmd>Neotree action=show focus position=left toggle=true<CR>', { desc = '[e] Toggle file explorer' })
    vim.keymap.set('n', '<leader>xp', '<cmd>Neotree action=show focus position=float toggle=true<CR>', { desc = '[p] Toggle file explorer (float)' })
  end,
}
