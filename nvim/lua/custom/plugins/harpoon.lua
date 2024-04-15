vim.keymap.set("n", "<leader>t", ":lua require('harpoon.mark').add_file()<CR>", { desc = "Add buffer to harpoon" })
vim.keymap.set(
	"n",
	"<leader>q",
	":lua require('harpoon.ui').toggle_quick_menu()<CR>",
	{ desc = "Toggle harpoon quick menu" }
)
vim.keymap.set("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", { desc = "Navigate to file 1" })
vim.keymap.set("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", { desc = "Navigate to file 2" })
vim.keymap.set("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", { desc = "Navigate to file 3" })
vim.keymap.set("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", { desc = "Navigate to file 4" })
vim.keymap.set("n", "<leader>5", ":lua require('harpoon.ui').nav_file(5)<CR>", { desc = "Navigate to file 5" })
vim.keymap.set("n", "<leader>6", ":lua require('harpoon.ui').nav_file(6)<CR>", { desc = "Navigate to file 6" })
vim.keymap.set("n", "<leader>7", ":lua require('harpoon.ui').nav_file(7)<CR>", { desc = "Navigate to file 7" })
vim.keymap.set("n", "<leader>8", ":lua require('harpoon.ui').nav_file(8)<CR>", { desc = "Navigate to file 8" })
vim.keymap.set("n", "<leader>9", ":lua require('harpoon.ui').nav_file(9)<CR>", { desc = "Navigate to file 9" })
vim.keymap.set("n", "<leader>0", ":lua require('harpoon.ui').nav_file(0)<CR>", { desc = "Navigate to file 0" })

return {
	"ThePrimeagen/harpoon",
}
