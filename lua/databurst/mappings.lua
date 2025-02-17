-- Formatting with LSP
vim.keymap.set("n", "ff", function()
  vim.lsp.buf.format()
end)

vim.keymap.set("i", "jk", "<ESC>", { noremap = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true })

-- Delete without yanking
vim.keymap.set("n", "<leader>d", '"_d', { noremap = true })
