:set encoding=UTF-8
:set clipboard+=unnamedplus
:set completeopt=menuone,noinsert,noselect
:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set splitright
:set splitbelow
:set ignorecase
:set smartcase
:set incsearch
:set hidden
:set termbidi

call plug#begin()
Plug 'tomasiser/vim-code-dark'
Plug 'pangloss/vim-javascript'
Plug 'szw/vim-maximizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kassio/neoterm'
Plug 'tpope/vim-commentary'
Plug 'lukas-reineke/lsp-format.nvim'
Plug 'itchyny/vim-gitbranch'
Plug 'preservim/NERDTree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
""Plug 'feline-nvim/feline.nvim'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
Plug 'xiyaowong/nvim-transparent'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'jghauser/mkdir.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'toppair/reach.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'windwp/nvim-spectre'
Plug 'preservim/nerdcommenter'
Plug 'github/copilot.vim'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'Raimondi/delimitMate'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-lua/popup.nvim'
call plug#end()

let mapleader = " "
if(has("termguicolors"))
	set termguicolors
endif

" inoremap { {}<Esc>ha
" inoremap ( ()<Esc>ha
" inoremap [ []<Esc>ha
" inoremap " ""<Esc>ha
" inoremap ' ''<Esc>ha
" inoremap ` ``<Esc>ha

nnoremap <C-a> :NERDTreeFind<cr>
nnoremap <C-B> :NERDTreeToggle<CR>
nnoremap <F5> :NERDTreeRefreshRoot<cr>
nnoremap <C-i> :PlugInstall<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <C-w> :enew<bar>bd #<CR>

" fzf
nnoremap <C-e> :Telescope find_files<CR>
nnoremap <leader><C-e> :Telescope file_browser<CR>
nnoremap <C-f> :Telescope live_grep<CR>
lua require("telescope").load_extension "file_browser"
lua require('telescope').load_extension 'media_files'

colorscheme codedark

" vim-maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

lua require("tterm")
let g:neoterm_default_mod = 'botright'
let g:neoterm_size = 10
let g:neoterm_autoinsert = 1
map ` <Nop>
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
nnoremap <C-q> :ToggleTerm<CR>
nnoremap <leader>q :ToggleTerm direction="float"<CR>
nnoremap <leader><C-Q> :ToggleTermToggleAll<CR>

nnoremap <leader>F :Neoformat prettier<CR>

" fugitive
nnoremap <leader>gg :G<CR>

"lspconfig
lua require'lspconfig'.tsserver.setup{ onattach=require'completion'.on_attach }

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <F2> <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gH <cmd>lua vim.lsp.buf.code_action()<CR>

"format
lua require("lsp-format").setup {}
lua require "lspconfig".tsserver.setup { on_attach = require "lsp-format".on_attach }

" transparent
let g:transparent_enabled = v:true

" colors
lua require'colorizer'.setup()

"switched 
lua require('reach').setup({ notifications = true })

"search current word
nnoremap <leader>s <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s <cmd>lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
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
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
