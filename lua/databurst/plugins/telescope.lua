return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6', -- or, branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({})
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
    vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
    vim.keymap.set('n', ';', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end
}
