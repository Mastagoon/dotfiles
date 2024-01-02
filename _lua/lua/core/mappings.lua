vim.g.mapleader = " "
vim.keymap.set("v", "<C-d>", "<Nop>")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<ESC>:w<CR>")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", '<A-j>', ":m .+1<CR>==")
vim.keymap.set("n", '<A-k>', ":m .-2<CR>==")
vim.keymap.set("i", '<A-j>', "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", '<A-k>', "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set("v", '<A-k>', ":m '>-2<CR>gv=gv")
vim.keymap.set("n", "<leader><C-e>", "<cmd>silent !tmux neww tms<CR>")
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
--vim.keymap.set("n", "<leader>ww", "<cmd>MindOpenMain<CR>")
vim.keymap.set("n", "-", vim.cmd.Ex)

-- CTags
function RTags()
  vim.cmd [[!ctags -f .tags --languages=ruby --exclude=.git -R .]]
end

vim.keymap.set("n", "rT", RTags)


-- Copilot settings
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set("n", "<C-e>", telescope.find_files, {})
vim.keymap.set("n", "<C-f>", telescope.live_grep, {})
vim.keymap.set('n', 'gt', telescope.tags, { desc = '[G]o to C[T]ags (telescope)', noremap = true })

-- Nvim Tree
vim.keymap.set("n", "<C-a>", ":NvimTreeFindFile<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<cr>", {noremap = true, silent = true})
vim.keymap.set("n", "<F5>", ":NvimTreeRefresh<cr>", {noremap = true, silent = true})

-- Transparency
vim.keymap.set("n", "<leader>tt", ":TransparentToggle<cr>", {noremap=true, silent=true})

-- Tagbar
vim.keymap.set("n", "<F8>", ":TagbarToggle<cr>", {noremap = true, silent = true})

-- NerdCommenter
vim.keymap.set("n", "", ":call NERDComment(0, 'toggle')<CR>", {noremap = true, silent = true})
vim.keymap.set("v", "", ":call nerdcommenter#Comment(0, 'invert')<CR>", {noremap = true, silent = true})

-- Emmet
vim.g.user_emmet_leader_key='<C-]>'

-- Smartbuffs
vim.keymap.set("n", "<leader>1", ":lua require('nvim-smartbufs').goto_buffer(1)<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>2", ":lua require('nvim-smartbufs').goto_buffer(2)<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>3", ":lua require('nvim-smartbufs').goto_buffer(3)<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>4", ":lua require('nvim-smartbufs').goto_buffer(4)<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>5", ":lua require('nvim-smartbufs').goto_buffer(5)<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>6", ":lua require('nvim-smartbufs').goto_buffer(6)<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>7", ":lua require('nvim-smartbufs').goto_buffer(7)<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>8", ":lua require('nvim-smartbufs').goto_buffer(8)<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>9", ":lua require('nvim-smartbufs').goto_buffer(9)<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<Right>", ":lua require('nvim-smartbufs').goto_next_buffer()<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<Tab>", ":lua require('nvim-smartbufs').goto_next_buffer()<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<Left>", ":lua require('nvim-smartbufs').goto_prev_buffer()<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<S-Tab>", ":lua require('nvim-smartbufs').goto_prev_buffer()<CR>", {noremap = true, silent = true})
