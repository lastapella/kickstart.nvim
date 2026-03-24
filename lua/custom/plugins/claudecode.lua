return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  config = {
    focus_after_send = true,
    diff_opts = {
      keep_terminal_focus = true,
      open_in_new_tab = true,
    },
  },
  keys = {
    { '<leader>cc', nil, desc = 'AI/Claude Code' },
    { '<leader>cc', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
    { '<leader>cf', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
    { '<leader>cr', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
    { '<leader>cC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
    { '<leader>cm', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
    { '<leader>cb', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
    { '<leader>cs', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
    {
      '<leader>cs',
      '<cmd>ClaudeCodeTreeAdd<cr>',
      desc = 'Add file',
      ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
    },
    {
      '<leader>cq',
      function()
        local seen = {}
        for _, entry in ipairs(vim.fn.getqflist()) do
          local path = vim.api.nvim_buf_get_name(entry.bufnr)
          if path ~= '' and not seen[path] then
            seen[path] = true
            vim.cmd('ClaudeCodeAdd ' .. vim.fn.fnameescape(path))
          end
        end
      end,
      desc = 'Add quickfix files',
    },
    -- Diff management
    { '<leader>ga', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
    { '<leader>gd', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
  },
}
