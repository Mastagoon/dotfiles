:set encoding=UTF-8
:set arabicshape
:set clipboard=unnamedplus
" let g:clipboard = {
      " \   'name': 'win32yank-wsl',
      " \   'copy': {
      " \      '+': 'win32yank.exe -i --crlf',
      " \      '*': 'win32yank.exe -i --crlf',
      " \    },
      " \   'paste': {
      " \      '+': 'win32yank.exe -o --lf',
      " \      '*': 'win32yank.exe -o --lf',
      " \   },
      " \   'cache_enabled': 0,
      " \ }
:set completeopt=menuone,noinsert,noselect
:set number
:set relativenumber
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set mouse=a
:set splitright
:set splitbelow
:set ignorecase
:set smartcase
:set incsearch
:set hidden
:set termbidi
:set signcolumn=yes:1

call plug#begin()
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tomasiser/vim-code-dark'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'lukas-reineke/lsp-format.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
Plug 'xiyaowong/nvim-transparent'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'toppair/reach.nvim'
Plug 'akinsho/toggleterm.nvim'
" Plug 'windwp/nvim-spectre'
Plug 'preservim/nerdcommenter'
Plug 'github/copilot.vim'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'Raimondi/delimitMate'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'famiu/nvim-reload'
Plug 'preservim/tagbar'
Plug 'metakirby5/codi.vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'lewis6991/gitsigns.nvim'
Plug 'kosayoda/nvim-lightbulb'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/eslint.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'lewis6991/hover.nvim'
Plug 'whatsthatsmell/codesmell_dark.vim'
Plug 'onsails/lspkind.nvim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact','dart','css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'psliwka/vim-smoothie'
call plug#end()

let mapleader = " "
if(has("termguicolors"))
	set termguicolors
endif

nnoremap <C-a> :NvimTreeFocus<cr>
nnoremap <C-B> :NvimTreeToggle<CR>
nnoremap <F5> :NvimTreeRefresh<cr>
nnoremap <C-i> :PlugInstall<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <C-w> :enew<bar>bd #<CR>

" fzf
nnoremap <C-e> :Telescope find_files<CR>
nnoremap <C-f> :Telescope live_grep<CR>
lua require("telescope").load_extension "file_browser"

colorscheme codedark
" set fillchars+=vert:│
" vim.cmd "colorscheme

lua require("toggleterm").setup()
lua require("tterm")
" let g:neoterm_default_mod = 'botright'
" let g:neoterm_size = 10
" let g:neoterm_autoinsert = 1
map ` <Nop>
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
nnoremap <C-q> :ToggleTerm<CR>
nnoremap <leader>q :ToggleTerm direction="float"<CR>
nnoremap <leader><C-Q> :ToggleTermToggleAll<CR>
map <C-v> <Nop>

" fugitive
nnoremap <leader>gg :G<CR>

"lspconfig
" lua require'lspconfig'.tsserver.setup{ onattach=require'completion'.on_attach }
" lua require'lspconfig'.dartls.setup{}

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <F2> <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gH <cmd>lua vim.lsp.buf.code_action()<CR>

"format
" lua require("lsp-format").setup {}
" lua require "lspconfig".tsserver.setup { on_attach = require "lsp-format".on_attach }

" transparent
let g:transparent_enabled = v:true
nnoremap tt :TransparentToggle<CR>

" colors
lua require'colorizer'.setup()

"switched 
lua require('reach').setup({ notifications = true })
nnoremap <leader>hh :ReachOpen buffers<CR>

"search current word
" nnoremap <leader>s <cmd>lua require('spectre').open_visual({select_word=true})<CR>
" vnoremap <leader>s <cmd>lua require('spectre').open_visual()<CR>
 " search in current file
" nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
" run command :Spectr
"
" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

" coc
nnoremap <C-.> :CocCommand actions.open<CR>
inoremap <C-.> :CocCommand actions.open<CR>

"other files
source $HOME/.config/nvim/config/coc.vim
source $HOME/.config/nvim/config/commenter.vim

"emmet
let g:user_emmet_leader_key='<C-]>'


"icons
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1
" let g:NERDTreeimitedSyntax = 1

"Tagbar
nmap <F8> :TagbarToggle<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"python
let g:python3_host_prog = '/usr/bin/python3'

lua require("main")
