syntax enable
set autoindent
set cursorline
set encoding=UTF-8
set guicursor+=n:hor10-Cursor/lCursor
set number
"set mouse=a
set shiftwidth=4
set shell=zsh
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set termguicolors
"set splitright
"set splitbelow

call plug#begin('~/.vim/plugged')

"# Görsel Eklentiler
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

"# Diğer Eklentiler
Plug 'preservim/nerdtree' " NerdTree
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'miyakogi/conoline.vim' " highlights
"Plug 'wellle/context.vim'
Plug 'tpope/vim-surround' " Surrounding ysw)
"Plug 'mg979/vim-visual-multi', {'branch': 'master'} " multi cursor
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

"Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
"Plug 'alvan/vim-closetag'
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc

call plug#end()

"# airline ayarları
let g:airline_extensions = ['branch', 'tabline']
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:airline_symbols.colnr = "\u33c7"
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"set rtp+=/usr/lib/python3.9/site-packages/powerline/bindings/vim/plugin

"# Renk Ayarları
set background=dark
let g:gruvbox_termcolors = 256
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox


let g:Hexokinase_highlighters = ['backgroundfull']

"#Kısa Yollar
nnoremap <C-s> :w<CR>

"#Eklenti Kısa Yolları
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nmap <F8> :TagbarToggle<CR>
"inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

