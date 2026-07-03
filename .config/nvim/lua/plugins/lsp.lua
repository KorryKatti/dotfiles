-- lua/plugins/lsp.lua

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    require('mason').setup()

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('mason-lspconfig').setup({
      ensure_installed = { "basedpyright", "clangd", "zls", "ols", "rust_analyzer", "gopls" },
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["basedpyright"] = function()
          require('lspconfig').basedpyright.setup({
            capabilities = capabilities,
            settings = {
              basedpyright = {
                analysis = {
                  typeCheckingMode = "standard",
                },
              },
            },
          })
        end,
        ["clangd"] = function()
          require('lspconfig').clangd.setup({
            capabilities = capabilities,
            cmd = { "clangd", "--background-index", "--clang-tidy" },
          })
        end,
        ["zls"] = function()
          require('lspconfig').zls.setup({
            capabilities = capabilities,
          })
        end,
        ["ols"] = function()
          require('lspconfig').ols.setup({
            capabilities = capabilities,
          })
        end,
        ["rust_analyzer"] = function()
          require('lspconfig').rust_analyzer.setup({
            capabilities = capabilities,
            settings = {
              ['rust-analyzer'] = {
                checkOnSave = { command = "clippy" },
              },
            },
          })
        end,
        ["gopls"] = function()
          require('lspconfig').gopls.setup({
            capabilities = capabilities,
          })
        end,
      }
    })
  end,
}
