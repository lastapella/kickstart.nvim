-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'ThePrimeagen/harpoon', branch = "harpoon2", dependencies = { { "nvim-lua/plenary.nvim" } } },
  { 'tpope/vim-surround' },
  { 'github/copilot.vim' },
  {
    'voldikss/vim-floaterm'
  },
  {
    'folke/trouble.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
      require("trouble").setup {
        auto_open = false,
        auto_close = true,
      }
      vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, {desc="Trouble Toggle"})
      vim.keymap.set("n", "<leader>xj", function() require("trouble").next({ skip_groups = true, jump = true }) end, {desc="Trouble Next"})
      vim.keymap.set("n", "<leader>xk", function() require("trouble").previous({ skip_groups = true, jump = true }) end, {desc="Trouble Previous"})
    end
  }

}
