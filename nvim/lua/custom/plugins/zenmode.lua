vim.keymap.set("n", "<leader>zz", ":ZenMode<CR>", { desc = "Centerpad toggle" })
return {
	"folke/zen-mode.nvim",
	"folke/twilight.nvim",
	config = function()
		require("zen-mode").setup({
			window = {
				-- height and width can be:
				-- * an absolute number of cells when > 1
				-- * a percentage of the width / height of the editor when <= 1
				-- * a function that returns the width or the height
				width = 120, -- width of the Zen window
				height = 1, -- height of the Zen window
				-- by default, no options are changed for the Zen window
				-- uncomment any of the options below, or add other vim.wo options you want to apply
				options = {
					-- signcolumn = "no", -- disable signcolumn
					-- number = false, -- disable number column
					-- relativenumber = false, -- disable relative numbers
					-- cursorline = false, -- disable cursorline
					-- cursorcolumn = false, -- disable cursor column
					-- foldcolumn = "0", -- disable fold column
					-- list = false, -- disable whitespace characters
				},
			},
			plugins = {
				twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
				tmux = { enabled = true }, -- disables the tmux statusline
			},
		})
	end,
}
