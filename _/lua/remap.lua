vim.g.mapleader = " "
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("v", '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set("v", '<A-k>', ":m '>-2<CR>gv=gv")
vim.keymap.set("n", "<leader><C-e>", "<cmd>silent !tmux neww tms<CR>")
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>ww", "<cmd>MindOpenMain<CR>")
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>")


vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
