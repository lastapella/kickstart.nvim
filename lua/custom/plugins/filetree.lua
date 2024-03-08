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
      window = {
        position = 'current',
        -- auto_expand_width = true,
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
        follow_current_file = {
          enabled = true,
        },
        window = {
          mappings = {
            ['/'] = nil,
          },
        },
      },
    }
    vim.keymap.set('n', '<leader>xe', '<cmd>Neotree action=show focus position=left toggle=true<CR>', { desc = '[e] Toggle file explorer' })
  end,
}
