require('close_buffers').setup({
	preserve_window_layout = { 'this', 'nameless' },
	next_buffer_cmd = function(windows)
		require('bufferline').cycle(1)
		local bufnr = vim.api.nvim_get_current_buf()

		for _, window in ipairs(windows) do
			vim.api.nvim_win_set_buf(window, bufnr)
		end
	end,
})

-- close all other buffers
vim.api.nvim_set_keymap(
	'n',
	'<leader><C-w>',
	[[<CMD>lua require('close_buffers').delete({type = 'hidden'})<CR>]],
	{ noremap = true, silent = true }
)
-- close nameless buffers
vim.api.nvim_set_keymap(
	'n',
	'<leader>tu',
	[[<CMD>lua require('close_buffers').delete({type = 'nameless'})<CR>]],
	{ noremap = true, silent = false }
)
-- close current buffer
vim.api.nvim_set_keymap(
	'n',
	'<C-w>',
	[[<CMD>lua require('close_buffers').delete({type = 'this'})<CR>]],
	{ noremap = true, silent = false }
)


require('bufferline').setup {
	options = {
		mode = "buffers", -- set to "tabs" to only show tabpages instead
		themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
		numbers = "none",
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		--- name_formatter can be used to change the buffer's label in the bufferline.
		--- Please note some names can/will break the
		--- bufferline so use this at your discretion knowing that it has
		--- some limitations that will *NOT* be fixed.
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		truncate_names = true, -- whether or not tab names should be truncated
		tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			if context.buffer:current() then
				return ''
			end

			return ''
		end,
		diagnostics_update_in_insert = false,
		-- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
		-- NOTE: this will be called a lot so don't do any heavy processing here
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
			}
		},
		color_icons = true,            -- whether or not to add the filetype icon highlights
		show_buffer_icons = true,      -- disable filetype icons for buffers
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		always_show_bufferline = true,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { 'close' }
		},
		--            sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
	}
}
