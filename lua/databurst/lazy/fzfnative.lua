return {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',

  config = function()
    require("telescope").setup {
      extension = {
        fzf = {
          fuzzy = true,
          ovverride_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        }
      }
    }
  end
}
