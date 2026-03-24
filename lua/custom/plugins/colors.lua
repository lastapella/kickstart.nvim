-- function ColorMyPencils(color)
--   color = color or "rose-pine"
--   vim.cmd.colorscheme(color)
--
--   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--   vim.api.nvim_set_hl(0, "NeotreeNormal", { bg = "none" })
--   vim.api.nvim_set_hl(0, 'Visual', { bg = "#524631", bold = true})
-- end
--
-- ColorMyPencils()

-- vim.o.background = ''

return {
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   config = function()
  --     require('rose-pine').setup {
  --       dim_inactive_windows = true,
  --       highlight_groups = {
  --         -- see: https://rosepinetheme.com/palette/
  --         -- Normal = { bg = 'surface' },
  --         -- NormalFloat = { bg = 'surface' },
  --         CursorLine = { bg = 'highlight_med' },
  --         Visual = { bg = 'highlight_high', bold = true },
  --
  --         NoiceCmdline = { bg = 'surface' },
  --         NoiceCmdlinePopupBorder = { fg = 'gold' },
  --         NoiceCmdlinePopupTitle = { fg = 'gold' },
  --         NoiceCmdlineIcon = { fg = 'gold' },
  --         NoiceCmdlinePopup = { bg = 'surface' },
  --         NoiceCmdlinePrompt = { bg = 'surface' },
  --
  --         -- TelescopeNormal = { bg = 'iris', fg = 'iris' },
  --         -- TelescopePromptNormal = { bg = 'iris'},
  --         -- TelescopePreviewNormal = { bg = 'surface'},
  --         -- Comment = { fg = "foam" },
  --         -- VertSplit = { fg = "muted", bg = "foam" },
  --       },
  --     }
  --     -- vim.cmd.colorscheme 'rose-pine'
  --   end,
  -- },
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- Load the colorscheme here
      -- You can configure highlights by doing something like
      require('tokyonight').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = 'storm', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        light_style = 'day', -- The theme is used when the background is set to light
        transparent = false,
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },

          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = 'dark', -- style for sidebars, see below
          floats = 'dark', -- style for floating windows
        },
        -- dim_inactive = true,
        on_colors = function(colors)
          colors.comment = '#828fd1'
          -- colors.fg_gutter = colors.orange
          -- colors.bg_visual = '#a371f5'
          -- colors.bg_highlight = '#2e3c64'
          --
          local function lualine_theme()
            local hl = {}

            hl.normal = {
              a = { bg = colors.blue, fg = colors.black, },
              b = { bg = colors.fg_gutter, fg = colors.blue },
              c = { bg = colors.bg_statusline, fg = colors.orange, gui='bold'},
            }

            hl.insert = {
              a = { bg = colors.green, fg = colors.black },
              b = { bg = colors.fg_gutter, fg = colors.green },
            }

            hl.command = {
              a = { bg = colors.yellow, fg = colors.black },
              b = { bg = colors.fg_gutter, fg = colors.yellow },
            }

            hl.visual = {
              a = { bg = colors.magenta, fg = colors.black },
              b = { bg = colors.fg_gutter, fg = colors.magenta },
            }

            hl.replace = {
              a = { bg = colors.red, fg = colors.black },
              b = { bg = colors.fg_gutter, fg = colors.red },
            }

            hl.terminal = {
              a = { bg = colors.green1, fg = colors.black },
              b = { bg = colors.fg_gutter, fg = colors.green1 },
            }

            hl.inactive = {
              a = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
              b = { bg = colors.bg_statusline, fg = colors.fg_sidebar, gui = 'bold' },
              c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
            }
            return hl

          end
          require('lualine').setup { options = { theme = lualine_theme } }
        end,
        on_highlights = function(hl, c)
          -- hl.Normal = {
          --   bg = c.bg_dark,
          -- }
          -- hl.NormalFloat = {
          --   bg = c.bg_dark,
          -- }
          -- hl.NormalNC = {
          --   bg = c.bg,
          -- }
          hl['DiagnosticUnnecessary'] = {
            fg = c.comment,
            italic = true,
          }

          hl.LineNr = {
            fg = c.orange, -- A light blue color from the theme's palette
            bold = false, -- Make the text bold
          }

          hl.LineNrBelow = {
            fg = c.orange, -- A light blue color from the theme's palette
            bold = false, -- Make the text bold
          }
          hl.LineNrAbove = {
            fg = c.orange, -- A light blue color from the theme's palette
            bold = false, -- Make the text bold
          }
          -- Change the color and style of the current line number
          hl.CursorLineNr = {
            fg = c.orange, -- An orange color
            bold = true,
            italic = true, -- Make the text italic
          }
          -- hl["@comment"] = {
          --   fg = c.purple,
          --   italic = true,
          -- }
          -- hl.Comment = {
          --   fg = c.purple,
          --   italic = true,
          -- }
          -- hl["@lsp.type.comment"] = {
          --   fg = c.purple,
          --   italic = true,
          -- }
          hl.CursorLine = {
            bg = c.bg_visual,
          }
          hl.Visual = {
            bg = c.blue7,
            italic = true,
          }
          -- hl.lualine_c_normal = {
          --   fg = c.orange,
          -- }
        end,
      }
      -- vim.cmd.colorscheme 'vim'

      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NeotreeNormal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = 'none' })

      -- vim.cmd.colorscheme 'tokyonight-storm'
    end,
  },
  -- {
  --   'EdenEast/nightfox.nvim',
  --   config = function()
  --     -- vim.o.background = ''
  --     -- vim.cmd.colorscheme 'nightfox'
  --   end,
  -- },
  -- {
  --   'rebelot/kanagawa.nvim',
  --   -- config = function()
  --   --   vim.o.background = ''
  --   --   vim.cmd.colorscheme 'kanagawa'
  --   -- end,
  -- },
  -- {
  --   'folke/tokyonight.nvim',
  --   -- config = function()
  --   --   vim.cmd.colorscheme('tokyonight')
  --   -- end,
  -- },
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   -- config = function()
  --   --   vim.cmd.colorscheme 'catppuccin'
  --   -- end,
  -- },
}
