require("telescope").load_extension "file_browser"
require("toggleterm").setup()
require("cybu").setup()
require'colorizer'.setup()
require('reach').setup({ notifications = true })
-- require("nvim-surround").setup({})

require("custom/tterm")
require("custom/nvimtree")
require("custom/telescope")
require("custom/cmp")
require("custom/harpoon")
require("custom/alpha")

require("lsp")
require("settings")
require("remap")
require("mason").setup()
require("mind").setup()
require("notify").setup({
	background_colour = "#000000",
})
require("persistence").setup()
require('lsp-notify').setup({
	notify = require('notify'),
})

require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

-- treesitter
local treesitter_parser_config = require "nvim-treesitter.parsers".get_parser_configs()
treesitter_parser_config.templ = {
  install_info = {
    url = "https://github.com/vrischmann/tree-sitter-templ.git",
    files = {"src/parser.c", "src/scanner.c"},
    branch = "master",
  },
}

require'nvim-treesitter.configs'.setup {
	incremental_selection= {
		enable= true
	},
	indent = { enable= true },
	matchup = { enable= true },
	autopairs = { enable= false },
	rainbow = { 
		enable= true,
		extended_mode= true,
		max_file_lines = 1000,
	},
	-- refactor = {
--
	-- }
  -- A list of parser names, or "all"
  ensure_installed = {"html", "javascript", "go", "rust"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
		enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

vim.filetype.add({
  extension = {
    astro = "astro",
		templ = "templ"
  },
})

require('close_buffers').setup({
  preserve_window_layout = { 'this' , 'nameless'},
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
			themable = true , -- allows highlight groups to be overriden i.e. sets highlights as default
			numbers = "none" ,
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
							text = "File Explorer" ,
							text_align = "left",
					}
			},
			color_icons = true , -- whether or not to add the filetype icon highlights
			show_buffer_icons = true, -- disable filetype icons for buffers
			show_buffer_close_icons = true,
			show_buffer_default_icon = true , -- whether or not an unrecognised filetype should show a default icon
			show_close_icon = true ,
			show_tab_indicators = true ,
			show_duplicate_prefix = true , -- whether to show duplicate buffer prefix
			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
			-- can also be a table containing 2 custom separators
			-- [focused and unfocused]. eg: { '|', '|' }
			always_show_bufferline = true,
			hover = {
					enabled = true,
					delay = 200,
					reveal = {'close'}
			},
--            sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
	}
}
