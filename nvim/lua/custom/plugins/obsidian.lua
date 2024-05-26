vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", { desc = "Search in Obsidian" })
vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", { desc = "Obsidian Today" })
vim.keymap.set("n", "<leader>oy", ":ObsidianYesterday<CR>", { desc = "Obsidian Yesterday" })
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { desc = "Obsidian New" })

return {
	"epwalsh/obsidian.nvim",
	tag = "*", -- recommended, use latest release instead of latest commit
	requires = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "the vault",
					path = "~/projects/obsidian",
				},
			},

			-- see below for full list of options 👇
		})
	end,
}
