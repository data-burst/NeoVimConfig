return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            highlight = "Directory",
          }
        },
      }
    })

    vim.keymap.set("n", "<A-,>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<A-.>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<A-c>", function()
      local current_buf = vim.api.nvim_get_current_buf()
      vim.cmd("bnext") -- Move to next buffer
      vim.api.nvim_buf_delete(current_buf, { force = false })
    end
    , { noremap = true, silent = true })
  end
}
