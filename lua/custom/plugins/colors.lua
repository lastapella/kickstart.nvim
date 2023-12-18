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

return {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd.colorscheme 'rose-pine'
     -- vim.cmd('colorscheme rose-pine')
    end
  }
