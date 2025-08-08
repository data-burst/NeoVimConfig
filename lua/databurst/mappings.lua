-- Formatting with LSP
vim.keymap.set("n", "ff", function()
  vim.lsp.buf.format()
end)

vim.keymap.set("i", "jk", "<ESC>", { noremap = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true })

-- Delete without yanking
vim.keymap.set("n", "<leader>d", '"_d', { noremap = true })

-- Resize windows
vim.keymap.set("n", "<leader>k", ":resize +2<CR>", { noremap = true })
vim.keymap.set("n", "<leader>j", ":resize -2<CR>", { noremap = true })
vim.keymap.set("n", "<leader>h", ":vertical resize +2<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":vertical resize -2<CR>", { noremap = true })
vim.keymap.set("n", "<leader>q", ":wq<CR>", { noremap = true })
