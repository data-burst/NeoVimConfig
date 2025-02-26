return {
  'AntonVanAssche/music-controls.nvim',

  config = function()
    require('music-controls').setup({
      default_player = 'spotify',
    })
    vim.keymap.set("n", "<leader>mm", ":MPlay<CR>", { noremap = true })
    vim.keymap.set("n", "<leader>mn", ":MPlay<CR>", { noremap = true })
    vim.keymap.set("n", "<leader><leader>", ":MNext<CR>", { noremap = true })
    vim.keymap.set("n", "<leader><leader><leader>", ":MPrev<CR>", { noremap = true })
    vim.keymap.set("n", "<leader>mc", ":MCurrent<CR>", { noremap = true })
    vim.keymap.set("n", "<leader>ms", ":MShuffle<CR>", { noremap = true })
  end
}
