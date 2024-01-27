vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set({ 'n', 'v' }, 'H', '^')
vim.keymap.set({ 'n', 'v' }, 'L', '$')

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format document' })

vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lprev<CR>zz')

vim.keymap.set('n', '<leader>re', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word under cursor' })
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set('n', '<BS>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<CR>')

vim.keymap.set('n', '<leader>f', '<cmd>Format<CR>')

vim.keymap.set('i', 'jk', '<Esc><Esc>')
-- vim.keymap.set("n", "<leader>6", "<c-^>")
vim.keymap.set('n', '<M-[>', '<cmd>bp<CR>', { noremap = true })
vim.keymap.set('n', '<M-]>', '<cmd>bn<CR>', { noremap = true })
-- Need terminal to remap <C-H> to \x1b72;5u  TMUX: bind -n C-H send-keys C-S-H 
vim.keymap.set('n', '<C-S-h>', '<cmd>bf<CR>', { noremap = true })
-- Need terminal to remap <C-H> to \x1b76;5u  TMUX: bind -n C-L send-keys C-S-L 
vim.keymap.set('n', '<C-S-l>', '<cmd>bl<CR>', { noremap = true })
vim.keymap.set('n', '<leader>;', '<c-^>')
vim.keymap.set('n', '<leader>bda', '<cmd>1,.-bd<CR><cmd>.+,$bd<CR>' )

vim.keymap.set('n', '<M-h>', '<C-w>h')
vim.keymap.set('n', '<M-l>', '<C-w>l')
vim.keymap.set('n', '<M-k>', '<C-w>k')
vim.keymap.set('n', '<M-j>', '<C-w>j')
vim.keymap.set('n', '<C-w>W', '<C-w>_', { desc = 'Max out windown height' })

vim.keymap.set('n', '<C-h>', '<C-o>', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-i>', { noremap = true })
vim.keymap.set({ 'n', 'i' }, '<C-i>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

vim.keymap.set('n', '<leader>?', require('telescope.builtin').help_tags, { desc = '[h] Find help tags' })
vim.keymap.set('n', '<leader>vo', function()
  require('telescope.builtin').oldfiles { only_cwd = true }
end, { desc = '[o] Find recently opened files (current directory)' })

vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
--
-- vim.api.nvim_set_keymap("i", "<C-\\>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

function vim.getVisualSelection()
  vim.cmd 'noau normal! "vy"'
  local text = vim.fn.getreg 'v'
  vim.fn.setreg('v', {})

  text = string.gsub(text, '\n', '')
  if #text > 0 then
    return text
  else
    return ''
  end
end

-- Telescope remaps
vim.keymap.set('v', '<leader>sc', function()
  local text = vim.getVisualSelection()
  require('telescope.builtin').current_buffer_fuzzy_find { default_text = text }
end, { noremap = true, silent = true, desc = 'Search current selection in buffer' })

vim.keymap.set('v', '<leader>sa', function()
  local text = vim.getVisualSelection()
  require('telescope.builtin').live_grep { default_text = text }
end, { noremap = true, silent = true, desc = 'Search current selection with grep' })

vim.keymap.set('n', '<leader>sq', function()
  require('telescope.builtin').quickfixhistory()
end, { noremap = true, silent = true, desc = 'Search for quickfix history' })

vim.keymap.set('n', '<leader>sc', function()
  require('telescope.builtin').git_commits()
end, { noremap = true, silent = true, desc = 'Search for git commits' })

-- Git remaps
vim.keymap.set('n', '<leader>gs', function()
  require('telescope.builtin').git_status()
end, { noremap = true, silent = true, desc = 'Search for git status' })

vim.keymap.set('n', '<leader>gb', function()
  require('telescope.builtin').git_branches()
end, { noremap = true, silent = true, desc = 'Search for git branches' })

vim.keymap.set('n', '<leader>gt', ':tab G<CR>', { noremap = true, silent = true, desc = 'Open Git in a new Tab' })
vim.keymap.set('n', '<leader>gP', ':G push<CR>', { noremap = true, silent = true, desc = 'Git push' })
vim.keymap.set('n', '<leader>gp', ':G pull<CR>', { noremap = true, silent = true, desc = 'Git pull' })

vim.keymap.set('n', '<leader>g,', ':diffget 1<CR>', { noremap = true, silent = true, desc = 'diffget 1 ' })
vim.keymap.set('n', '<leader>gm', ':diffget 2<CR>', { noremap = true, silent = true, desc = 'diffget 2 ' })
vim.keymap.set('n', '<leader>g.', ':diffget 3<CR>', { noremap = true, silent = true, desc = 'diffget 3 ' })

vim.keymap.set('n', '<leader>sp',require("spectre").toggle, {
    desc = "Toggle Spectre"
})
