local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

function saveServerInfo()
  local servername = vim.v.servername
  -- Get current tmux window
  local handle = io.popen "tmux display-message -p '#I'"
  local tmuxWindowId = handle:read '*a'
  handle:close()
  tmuxWindowId = string.sub(tmuxWindowId, 1, string.len(tmuxWindowId) - 1)

  -- Get current tmux pane
  local handle2 = io.popen "tmux display-message -p '#P'"
  local tmuxPaneId = handle2:read '*a'
  handle2:close()

  tmuxPaneId = string.sub(tmuxPaneId, 1, string.len(tmuxPaneId) - 1)
  local cwd = vim.fn.getcwd()
  -- print('window: ' .. tmuxWindowId)
  -- print('pane: ' .. tmuxPaneId)
  vim.fn.writefile({ servername, tmuxWindowId, tmuxPaneId, cwd }, '/tmp/nvim-focuslost')
end

-- Save last nvim server id when nvim loses focus (FocusLost)
autocmd('FocusGained', {
  group = augroup('focus_gained', {}),
  pattern = '*',
  callback = saveServerInfo,
})
-- Save last nvim server id when nvim loses focus (FocusLost)
autocmd('UIEnter', {
  group = augroup('ui_enter', {}),
  pattern = '*',
  callback = saveServerInfo,
})
