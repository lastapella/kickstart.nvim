vim.g.tmux_navigator_no_mappings = 1
return {
  'christoomey/vim-tmux-navigator',
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
    'TmuxNavigatePrevious',
  },
  keys = {
    { '<m-h>', '<cmd>TmuxNavigateLeft<cr>' },
    { '<m-j>', '<cmd>TmuxNavigateDown<cr>' },
    { '<m-k>', '<cmd>TmuxNavigateUp<cr>' },
    { '<m-l>', '<cmd>TmuxNavigateRight<cr>' },
    { '<m-\\>', '<cmd>TmuxNavigatePrevious<cr>' },
  },
}
