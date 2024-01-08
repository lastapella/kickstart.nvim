vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format document" })

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>re", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<BS>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>")

vim.keymap.set("i", "jk", "<Esc><Esc>")
vim.keymap.set("n", "<leader>6", "<c-^>")

vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-l>", "<C-w>l")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<M-j>", "<C-w>j")

vim.keymap.set("i", "<C-i>", function() vim.lsp.buf.signature_help() end, opts)


vim.keymap.set('n', '<leader>?', require('telescope.builtin').help_tags, { desc = '[h] Find help tags' })
vim.keymap.set('n', '<leader>vo', function()
  require('telescope.builtin').oldfiles({ only_cwd = true })
end, { desc = '[o] Find recently opened files (current directory)' })

vim.keymap.set('n', '<leader>xe', '<cmd>Neotree toggle<CR>', { desc = '[e] Toggle file explorer' })

vim.keymap.set('i', '{}', '{}<Left><CR><CR><Up>')
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
--
-- vim.api.nvim_set_keymap("i", "<C-\\>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
