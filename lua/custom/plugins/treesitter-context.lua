-- vim.keymap.set("n", "[c", function()
--   vim.cmd("ma `")
--   require("treesitter-context").go_to_context()
--   vim.cmd("norm! zz")
-- end, { silent = true })

-- vim.keymap.set("n", "]c", "``zz")


local M = {'nvim-treesitter/nvim-treesitter-context'  }

function M.config() 
  local ts_context = require "treesitter-context"

  ts_context.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    separator = '-',
    max_lines = 8
  }
end

return M
