return {
  'kosayoda/nvim-lightbulb',
  config = function()
    require('nvim-lightbulb').update_lightbulb({
      autocmd = { enabled = true }
    })
  end,
}
