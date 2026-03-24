vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.cursorline = true
-- vim.cmd [[highlight CursorLine ctermbg=0 guibg=#474070]]
-- vim.cmd [[highlight Visual ctermfg=0 guibg=#474070]]

vim.opt.termguicolors = true
-- vim.cmd([[
--   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
--   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
-- ]])

vim.opt.scrolloff = 12
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

vim.opt.updatetime = 50

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set additional filetypes
vim.filetype.add {
  extension = {
    tfvars = 'terraformvarscustom',
  },
}
vim.treesitter.language.register('terraform', 'terraformvarscustom')

--vim.opt.colorcolumn = "80"

-- vim.cmd [[
--     let g:clipboard = {
--   \   'name': 'WslClipboard',
--   \   'copy': {
--   \      '+': 'clip.exe',
--   \      '*': 'clip.exe',
--   \    },
--   \   'paste': {
--   \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   \   },
--   \   'cache_enabled': 0,
--   \ }
-- ]]
--

if os.getenv('CONDA_PREFIX') then
  print('Setting python3_host_prog to ' .. os.getenv('CONDA_PREFIX') .. '/bin/python3')
  vim.g.python3_host_prog = os.getenv('CONDA_PREFIX') .. '/bin/python3'
end
