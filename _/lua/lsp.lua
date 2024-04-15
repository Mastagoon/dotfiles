local null_ls = require("null-ls")

-- local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.keymap.set("n", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })

			-- format on save
			-- vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
			-- vim.api.nvim_create_autocmd(event, {
				-- buffer = bufnr,
				-- group = group,
				-- callback = function()
					-- vim.lsp.buf.format({ bufnr = bufnr, async = async })
				-- end,
				-- desc = "[lsp] format on save",
			-- })
		end

		if client.supports_method("textDocument/rangeFormatting") then
			vim.keymap.set("x", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })
		end
	end,
	sources = {
		null_ls.builtins.formatting.goimports,
	}
})
-- prettier
local prettier = require("prettier")

prettier.setup({
	bin = 'prettierd', -- or `'prettierd'` (v0.22+)
	["null-ls"] = {
		condition = function()
			return prettier.config_exists({
				--				if `false`, skips checking `package.json` for `"prettier"` key
				check_package_json = true,
			})
		end,
		runtime_condition = function(params)
			--	return false to skip running prettier
			return true
		end,
		timeout = 5000,
	}
})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "T", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[e", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]e", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>wr", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

	-- lsp_zero.buffer_autoformat()
end)



require 'lspconfig'.htmx.setup {
	on_attach = lsp_zero.on_attach,
	filetypes = { "html", "templ" },
}

require 'lspconfig'.clangd.setup {
	on_attach = lsp_zero.on_attach,
	cmd = { "clangd",
		"--header-insertion=never",
		"--limit-references=100",
		"--limit-results=20",
		"-j=8",
		"--malloc-trim",
		"--background-index",
		"--pch-storage=memory",

	},
}

require 'lspconfig'.gopls.setup {
	on_attach = lsp_zero.on_attach,
	filetypes = { "go" },
}

require('lspconfig.configs').templ = {
	default_config = {
		cmd = { "templ", "lsp" },
		filetypes = { 'templ' },
		root_dir = require('lspconfig').util.root_pattern("go.mod"),
		settings = {},
	},
}

require 'lspconfig'.templ.setup {
	on_attach = lsp_zero.on_attach,
	filetypes = { "templ" },
}

require 'lspconfig'.tailwindcss.setup {
	on_attach = lsp_zero.on_atach,
	filetypes = { "html", "templ", "jsx", "javascriptreact", "typescriptreact" },
	init_options = {
		userLanguages = {
			templ = "html"
		}
	}
}

require('mason').setup({})


require('mason-lspconfig').setup({
	ensure_installed = { 'tsserver', 'rust_analyzer', 'gopls', "htmx", "templ" },
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	}
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
	},
	-- formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	}),
})
