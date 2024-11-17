return {
  "neovim/nvim-lspconfig",  -- Ensure lspconfig is loaded
  opts = {
    servers = {
      gopls = {},  -- Add gopls (Go language server)
    },
  },
}

