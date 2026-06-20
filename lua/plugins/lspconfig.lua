
vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig"
})

-- copied lazy vim config

-- 1. Configure Diagnostics
-- Replaced LazyVim icons with standard NerdFont icons
vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})

-- 2. Setup Global Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.workspace = {
  fileOperations = {
    didRename = true,
    willRename = true,
  },
}
-- Note: If you use nvim-cmp, uncomment the line below to add snippet capabilities
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- 3. Set up Autocommand for Keymaps, Inlay Hints, and Codelens
-- This ensures these features only attach to buffers with an active LSP
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local bufnr = ev.buf

    -- Enable Inlay Hints if supported
    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      -- LazyVim excluded 'vue' files; we can mimic that here
      if vim.bo[bufnr].filetype ~= "vue" then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    end

    -- Keymaps
    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
    end

    map("n", "<leader>cl", "<cmd>LspInfo<cr>", "Lsp Info")
    map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
    map("n", "gr", vim.lsp.buf.references, "References")
    map("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
    map("n", "gy", vim.lsp.buf.type_definition, "Goto T[y]pe Definition")
    map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
    map("n", "K", vim.lsp.buf.hover, "Hover")
    map("n", "gK", vim.lsp.buf.signature_help, "Signature Help")
    map("i", "<c-k>", vim.lsp.buf.signature_help, "Signature Help")
    map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map({ "n", "x" }, "<leader>cc", vim.lsp.codelens.run, "Run Codelens")
    map("n", "<leader>cC", vim.lsp.codelens.refresh, "Refresh & Display Codelens")
    map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
    
    -- Organize Imports (fallback to standard standard built-in approach)
    map("n", "<leader>co", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" } },
        apply = true,
      })
    end, "Organize Imports")
  end,
})

-- 1. Configure the server using the native API
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      codeLens = { enable = true },
      completion = { callSnippet = "Replace" },
      doc = { privateName = { "^_" } },
      hint = {
        enable = true,
        setType = false,
        paramType = true,
        paramName = "Disable",
        semicolon = "Disable",
        arrayIndex = "Disable",
      },
    },
  },
})

-- 2. Explicitly enable the server so it attaches to your buffers
vim.lsp.enable("lua_ls")
