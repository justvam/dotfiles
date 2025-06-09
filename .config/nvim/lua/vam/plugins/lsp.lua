return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        'neovim/nvim-lspconfig',

        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',

        "L3MON4D3/LuaSnip",
        'saadparwaiz1/cmp_luasnip',
        "j-hui/fidget.nvim",
    },

    config = function ()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("fidget").setup()
        require("mason").setup()
        require('mason-lspconfig').setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "pyright",
                "clangd",

            },
            automatic_enable = true
        })

        for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
            if server == "lua_ls" then
                  vim.lsp.config('lua_ls', {
                    capabilities = capabilities,
                    on_init = function(client)
                      if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if
                          path ~= vim.fn.stdpath('config')
                          and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                        then
                          return
                        end
                      end

                      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                          version = 'LuaJIT',
                          path = {
                            'lua/?.lua',
                            'lua/?/init.lua',
                          },
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                          checkThirdParty = false,
                          library = {
                            vim.env.VIMRUNTIME
                            -- Depending on the usage, you might want to add additional paths
                            -- here.
                            -- '${3rd}/luv/library'
                            -- '${3rd}/busted/library'
                          }
                        }
                      })
                    end,
                    settings = {
                      Lua = {}
                    }
                  })
            else
                vim.lsp.config(server, {
                    capabilities = capabilities,
                })
            end
        end


        local cmp = require'cmp'

        cmp.setup({
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
          },
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ['<Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                  fallback()
                end
            end,
            ['<S-Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                  fallback()
                end
              end

          }),
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
             { name = 'luasnip' }, -- For luasnip users.
          }, {
            { name = 'buffer' },
          })
        })
        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
        })
    end


}
