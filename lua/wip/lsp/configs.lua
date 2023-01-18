local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local lspconfig = require("lspconfig")

local servers = {
  "jsonls",
  "sumneko_lua",
  "html",
  "cssls",
  "tsserver",
  --"eslint",
  --"phpactor",
  "dockerls",
  --"clangd",
  --"zls"
}

lsp_installer.setup {
  ensure_installed = servers
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("wip.lsp.handlers").on_attach,
    capabilities = require("wip.lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "wip.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end
  lspconfig[server].setup(opts)
end

-- RUST Settings
-- require('rust-tools').setup({
--   tools = {
--     autoSetHints = true,
--     runnables = {
--       use_telescope = true
--     },
--     inlay_hints = {
--       show_parameter_hints = false,
--       parameter_hints_prefix = "",
--       other_hints_prefix = "",
--     },
--   },
--   server = {
--     settings = {
--       ["rust-analyzer"] = {
--         diagnostics = {
--           enable = true,
--           disabled = { "unresolved-proc-macro" },
--           enableExperimental = true,
--         },
--         -- enable clippy on save
--         checkOnSave = {
--           command = "clippy"
--         },
--       }
--     }
--   },
-- })

require('rust-tools').setup({
  server = {
    settings = {
      ["rust-analyzer"] = {
        inlayHints = { locationLinks = false },
      },
    },
  },
})
