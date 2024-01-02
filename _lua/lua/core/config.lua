vim.opt.tags = '.tags'
vim.opt.encoding="utf-8"
vim.opt.clipboard="unnamedplus"
vim.opt.arabicshape=true
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.autoindent=true
vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.smarttab=true
vim.opt.softtabstop=2
vim.opt.mouse="a"
vim.opt.splitright=true
vim.opt.splitbelow=true
vim.opt.ignorecase=true
vim.opt.termguicolors=true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.filetype.add({
	extension = {
		astro = "astro",
		templ = "templ"
	},
})
