local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local set_nav_file = function(num)
	return function()
		mark.nav_file(num)
	end
end

vim.keymap.set("n", "<A-t>", mark.add_file)
vim.keymap.set("n", "<A-q>", ui.toggle_quick_menu)
vim.keymap.set("n", "<A-1>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<A-2>", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<A-3>", mark.nav_file(3))
-- vim.keymap.set("n", "<A-4>", mark.nav_file(4))
-- vim.keymap.set("n", "<A-5>", mark.nav_file(5))
-- vim.keymap.set("n", "<leader><C-e>", mark.toggle_quick_menu)
-- vim.keymap.set("n", "<leader><C-e>", mark.toggle_quick_menu)
