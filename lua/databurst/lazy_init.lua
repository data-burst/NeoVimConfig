local lazypath = vim.fn.getcwd() .. "/lib/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup({
--   spec = {
--     { import = "databurst.lazy" },
--   },
--   change_detection = { notify = false },
--   checker = { enabled = true },
-- })
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "databurst.lazy" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
