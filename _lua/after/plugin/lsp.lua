vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

local lsp = require('lsp-zero')

lsp.preset('recommended')

-- keymaps to add only on buffers with LSP support (overriding grep/tags based defaults)
lsp.on_attach(function(client, bufnr)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,     { desc = '[G]o to [d]efinition',buffer = bufnr, remap = false })
  vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end,    { desc = '[G]o to [D]eclaration',buffer = bufnr, remap = false })
  vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end,     { desc = '[G]o to [R]eferences (with LSP)', buffer = bufnr, remap = false })
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, { desc = '[G]o to [I]mplementation (with LSP)', buffer = bufnr, remap = false })
  vim.keymap.set("n", "T",  function() vim.lsp.buf.hover() end,          { desc = '[K] Hover info', buffer = bufnr, remap = false })
  vim.keymap.set("n", "r",  function() vim.lsp.buf.rename() end,         { desc = '[R]ename symbol (with LSP)', buffer = bufnr, remap = false })
	vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "[e", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]e", function() vim.diagnostic.goto_prev() end, opts)
end)

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['solargraph'].setup  { capabilities = capabilities }
  require('lspconfig')['html'].setup        { capabilities = capabilities }
  require('lspconfig')['cssls'].setup       { capabilities = capabilities }
  require('lspconfig')['tsserver'].setup    { capabilities = capabilities }
  require('lspconfig')['clangd'].setup    { capabilities = capabilities }
  --require('lspconfig')['eslint'].setup      { capabilities = capabilities }
  require('lspconfig')['lua_ls'].setup { capabilities = capabilities }

lsp.setup()
