return {
  "eandrju/cellular-automaton.nvim",
  lazy = false,
  config = function()
    local config = {
      fps = 30,
      name = 'slide',
    }
    -- update function
    config.update = function(grid)
      for i = 1, #grid do
        local prev = grid[i][#(grid[i])]
        for j = 1, #(grid[i]) do
          grid[i][j], prev = prev, grid[i][j]
        end
      end
      return true
    end

    require("cellular-automaton").register_animation(config)

    vim.keymap.set("n", "<leader>rain", "<cmd>CellularAutomaton make_it_rain<CR>")
    vim.keymap.set("n", "<leader>life", "<cmd>CellularAutomaton game_of_life<CR>")
    vim.keymap.set("n", "<leader>scramble", "<cmd>CellularAutomaton scramble<CR>")
    vim.keymap.set("n", "<leader>slide", "<cmd>CellularAutomaton slide<CR>")
  end
}
