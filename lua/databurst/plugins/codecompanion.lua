return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            env = {
              api_key = vim.fn.getenv("OPENAI_API_KEY"),
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "openai",
        },
        inline = {
          adapter = "copilot",
        }
      }
    })

    vim.keymap.set("n","<C-s>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    vim.keymap.set("n","<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })

  end,
}
