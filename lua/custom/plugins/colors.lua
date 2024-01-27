-- function ColorMyPencils(color)
--   color = color or "rose-pine"
--   vim.cmd.colorscheme(color)
--
--   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--   vim.api.nvim_set_hl(0, 'Visual', { bg = "#524631", bold = true})
-- end
--
-- ColorMyPencils()

-- vim.o.background = ''

return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        -- dim_inactive_windows = true,
        highlight_groups = {
          -- see: https://rosepinetheme.com/palette/
          Normal = { bg = 'base0' },
          -- Comment = { fg = "foam" },
          -- VertSplit = { fg = "muted", bg = "foam" },
        },
      }
      vim.cmd.colorscheme 'rose-pine-moon'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    -- config = function()
    --   vim.o.background = ''
    --   vim.cmd.colorscheme 'kanagawa'
    -- end,
  },
  {
    'folke/tokyonight.nvim',
    -- config = function()
    --   vim.cmd.colorscheme('tokyonight')
    -- end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    -- config = function()
    --   vim.cmd.colorscheme 'catppuccin'
    -- end,
  },
}
