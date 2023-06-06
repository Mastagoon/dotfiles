:set encoding=UTF-8
:set arabicshape
:set clipboard=unnamedplus
:set completeopt=menu,menuone,noselect
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
:set termguicolors
nnoremap <C-d> <NOP>
let g:do_filetype_lua = 1
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n

call plug#begin()
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tomasiser/vim-code-dark'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'github/copilot.vim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-lua/completion-nvim'
" Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
" Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
Plug 'xiyaowong/nvim-transparent'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'toppair/reach.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'preservim/nerdcommenter'
Plug 'mlaursen/vim-react-snippets'
Plug 'mattn/emmet-vim'
Plug 'Raimondi/delimitMate'
Plug 'ryanoasis/vim-devicons'
Plug 'famiu/nvim-reload'
Plug 'preservim/tagbar'
Plug 'metakirby5/codi.vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'lewis6991/gitsigns.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'psliwka/vim-smoothie'
Plug 'cljoly/telescope-repo.nvim'
Plug 'famiu/bufdelete.nvim'
Plug 'ghillb/cybu.nvim'
Plug 'johann2357/nvim-smartbufs'
Plug 'pantharshit00/vim-prisma'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'neovim/nvim-lspconfig'
Plug 'wakatime/vim-wakatime'
" autocompletion 7 snipps
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'lukas-reineke/lsp-format.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" vsnip .
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'onsails/lspkind.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'luochen1990/rainbow'
Plug 'williamboman/mason.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'jose-elias-alvarez/typescript.nvim'
Plug 'kylechui/nvim-surround'
Plug 'kazhala/close-buffers.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'phaazon/mind.nvim'
Plug 'mhartington/oceanic-next'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'andweeb/presence.nvim'
call plug#end()

lua require("main")

" set t_Co=256

syntax enable

colorscheme OceanicNext
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

let mapleader = " "
" if(has("termguicolors"))
	" set termguicolors
" endif

nnoremap <C-a> :NvimTreeFindFile<cr>
nnoremap <C-B> :NvimTreeToggle<CR>
nnoremap <F5> :NvimTreeRefresh<cr>
nnoremap <C-i> :PlugInstall<CR>
nnoremap <Tab> :CybuNext<CR>
" nnoremap <C-w> :enew<bar>bd #<CR>

" fzf
nnoremap <C-e> :Telescope find_files<CR>
nnoremap <C-f> :Telescope live_grep<CR>

" set fillchars+=vert:│
" vim.cmd "colorscheme

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
" source $HOME/.config/nvim/config/lsp.vim
" lua require'lspconfig'.tsserver.setup{ onattach=require'completion'.on_attach }
" lua require'lspconfig'.dartls.setup{}

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <F2> <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gH <cmd>lua vim.lsp.buf.code_action()<CR>

"format
" lua require("lsp-format").setup {}
" lua require "lspconfig".tsserver.setup { on_attach = require "lsp-format".on_attach }
lua require'lspconfig'.astro.setup{}

" transparent
let g:transparent_enabled = v:true
nnoremap tt :TransparentToggle<CR>

" colors

"switched 
nnoremap <leader>hh :ReachOpen buffers<CR>
"
" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

" coc
" nnoremap <C-.> :CocCommand actions.open<CR>
" inoremap <C-.> :CocCommand actions.open<CR>

"other files
" source $HOME/.config/nvim/config/coc.vim
source $HOME/.config/nvim/config/commenter.vim

"emmet
let g:user_emmet_leader_key='<C-]>'

"Tagbar
nmap <F8> :TagbarToggle<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

"python
let g:python3_host_prog = '/usr/bin/python3'


" lua vim.notify = require("notify")
"
" Jump to the N buffer (by index) according to :ls buffer list
" where N is NOT the buffer number but the INDEX in such list
" NOTE: it does not include terminal buffers
nnoremap <Leader>1 :lua require("nvim-smartbufs").goto_buffer(1)<CR>
nnoremap <Leader>2 :lua require("nvim-smartbufs").goto_buffer(2)<CR>
nnoremap <Leader>3 :lua require("nvim-smartbufs").goto_buffer(3)<CR>
nnoremap <Leader>4 :lua require("nvim-smartbufs").goto_buffer(4)<CR>
nnoremap <Leader>5 :lua require("nvim-smartbufs").goto_buffer(5)<CR>
nnoremap <Leader>6 :lua require("nvim-smartbufs").goto_buffer(6)<CR>
nnoremap <Leader>7 :lua require("nvim-smartbufs").goto_buffer(7)<CR>
nnoremap <Leader>8 :lua require("nvim-smartbufs").goto_buffer(8)<CR>
nnoremap <Leader>9 :lua require("nvim-smartbufs").goto_buffer(9)<CR>

" Improved :bnext :bprev behavior (without considering terminal buffers)
nnoremap <Right> :lua require("nvim-smartbufs").goto_next_buffer()<CR>
nnoremap <Left> :lua require("nvim-smartbufs").goto_prev_buffer()<CR>


if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	au! BufRead,BufNewFile *.astro		setfiletype astro
augroup END

" close tags
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx"
" let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle