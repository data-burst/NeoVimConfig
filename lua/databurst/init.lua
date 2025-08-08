-- Restore cursor to last position when reopening a file
local restore_cursor = vim.api.nvim_create_augroup("RestoreCursor", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
  group = restore_cursor,
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')      -- {line, col}
    local lcount = vim.api.nvim_buf_line_count(0)

    if mark[1] > 0 and mark[1] <= lcount then
      -- pcall: avoid errors for unreadable positions (e.g., help buffers)
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.g.mapleader = " " -- set leader key before lazy

require("databurst.lazy_init")

require("databurst.set")
require("databurst.mappings")
