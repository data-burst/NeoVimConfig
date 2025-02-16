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

    vim.keymap.set("n", "<A-,>", ":BufferLineCyclePrev<CR>", { silent = true })
    vim.keymap.set("n", "<A-.>", ":BufferLineCycleNext<CR>", { silent = true })
  end
}

