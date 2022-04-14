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
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Plug 'xiyaowong/nvim-transparent'
call plug#end()

let mapleader = " "

if(has("termguicolors"))
	set termguicolors
endif

inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-i> :PlugInstall<CR>

" fzf
nnoremap <C-e> :GFiles<CR>

colorscheme codedark

" vim-maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

let g:neoterm_default_mod = 'vertical'
let g:neoterm_size = 60
let g:neoterm_autoinsert = 1
map ` <Nop>
nnoremap <C-s> :w<CR>
nnoremap <C-q> :Ttoggle<CR>
inoremap <C-q> <Esc> :Ttoggle<CR>


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
