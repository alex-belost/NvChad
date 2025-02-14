return {
  "neovim/nvim-lspconfig",
  config = function()
    local configs = require "nvchad.configs.lspconfig"

    local on_attach = configs.on_attach
    local capabilities = configs.capabilities

    local lspconfig = require "lspconfig"

    local servers = { "html", "cssls", "ts_ls", "angularls", "emmet_ls", "bashls" }

    local function organize_imports()
      local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
      }
      vim.lsp.buf.execute_command(params)
    end

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        commands = {
          OrganizeImports = {
            organize_imports,
            description = "Organize Imports",
          },
        },
      }
    end

    lspconfig.prismals.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- TODO: Use for Vue development
    -- lspconfig.volar.setup {
    --   on_attach = on_attach,
    --   capabilities = capabilities,
    --   filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    --   init_options = {
    --     vue = {
    --       hybridMode = false,
    --     },
    --   },
    -- }

    -- lspconfig.eslint.setup {
    --   on_attach = function(client, _)
    --     client.server_capabilities.diagnosticProvider = false -- Отключает диагностику от eslint-lsp
    --   end,
    -- }
  end,
}
