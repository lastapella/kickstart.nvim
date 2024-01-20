local isDiffMode = false
function Startdiff(branch)
  branch = branch
    or vim.api.nvim_exec2('Git config --get init.defaultBranch', { output = true })['output']
    or vim.api.nvim_exec2('Git symbolic-ref refs/remotes/origin/HEAD --short', { output = true })['ouput']
  print('Diff with ' .. branch)
  vim.cmd('Git difftool ' .. branch)
  vim.cmd('Gitsigns change_base ' .. branch .. ' global')
  vim.cmd 'Gitsigns toggle_deleted'
end

function Resetdiff()
  print 'Reset diff'
  vim.cmd 'Gitsigns toggle_deleted'
  vim.cmd 'Gitsigns change_base'
  vim.cmd 'ccl'
end

function ToggleDiff(branch)
  if isDiffMode then
    Resetdiff()
    isDiffMode = false
  else
    Startdiff(branch)
    isDiffMode = true
  end
end

vim.keymap.set('n', '<leader>gr',function() ToggleDiff() end, { desc = 'Enter custom branch diff mode' })
