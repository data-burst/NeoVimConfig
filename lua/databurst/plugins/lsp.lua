-- Adapted from a combo of
-- https://lsp-zero.netlify.app/v3.x/blog/theprimeagens-config-from-2022.html
-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
    "zbirenbaum/copilot-cmp",
    "rafamadriz/friendly-snippets"
  },
  config = function()
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    require("fidget").setup({})
    require("mason").setup()
    local on_attach = function(client, buffer)
      vim.api.nvim_buf_set_keymap(buffer, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buffer, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buffer, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buffer, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buffer, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buffer, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { noremap = true, silent = true })
    end
    require("mason-lspconfig").setup({
      automatic_installation = false,
      ensure_installed = {
        "lua_ls",
        "ruff",
        "pylsp",
        "clangd",
        "rust_analyzer",
        "bashls",
        "dockerls",
        "jdtls",
        "jsonls",
        "sqlls",
        "yamlls"
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
        lua_ls = function()
          require("lspconfig").lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              Lua = {
                runtime = {
                  version = 'LuaJIT'
                },
                diagnostics = {
                  globals = { 'vim', 'love' },
                },
                workspace = {
                  library = {
                    vim.env.VIMRUNTIME,
                  }
                }
              }
            }
          })
        end
      }
    })

    require("copilot_cmp").setup()

    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    -- this is the function that loads the extra snippets to luasnip
    -- from rafamadriz/friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    luasnip = require("luasnip")

    local kind_icons = {
      Text = "󰊄",
      Method = "m",
      Function = "󰊕",
      Constructor = "",
      Field = "",
      Variable = "󰫧",
      Class = "󰝯",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "󰇼",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "ﲀ",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
      Copilot = "",
    }
    cmp.setup({
      sources = {
        { name = 'copilot' },
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if luasnip.expandable() then
              luasnip.expand()
            else
              cmp.confirm({
                select = true,
              })
            end
          else
            fallback()
          end
        end),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
            copilot = "[Copilot]",
          })[entry.source.name]
          return vim_item
        end,
      }
    })
  end
}
