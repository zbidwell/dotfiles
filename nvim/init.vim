set nocompatible
syntax on
set hidden
set mouse=a
set nowrap
set encoding=utf8
set nobackup
set nowritebackup
set termguicolors

set number
set relativenumber
set colorcolumn=100
set signcolumn=yes
set updatetime=300

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

set autoindent

set showmatch
set hlsearch
set wildmode=longest,list

set splitbelow
set splitright
set scrolloff=10

let mapleader = "\<space>"

filetype plugin indent on

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/seoul256.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-rust-analyzer']

Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-commentary'

call plug#end()

" Colorscheme settings
set background=dark
" darker than default bg
let g:seoul256_background=234
colorscheme seoul256
let g:lightline = { 'colorscheme': 'seoul256' }

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
" run rustfmt on save for rust files
autocmd BufWritePre *.rs :Autoformat

" fzf ripgrep search
nnoremap <silent> <Leader>r :Rg<CR>
" fzf file search
nnoremap <silent> <Leader>f :Files<CR>

" tab support for autocomplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" language server commands
nmap gd <Plug>(coc-definition)
nmap <silent> <Leader>k :call CocAction('doHover')<CR>
nmap <Leader>e :CocList diagnostics<CR>
nmap <F2> <Plug>(coc-rename)
nmap <F5> :CocList<CR> 

" turn off search highlighting
nnoremap <silent> <Leader>h :nohlsearch<CR>

" faster movement
nnoremap J 5j
nnoremap K 5k

nnoremap H ^
nnoremap L $

" center after search
cnoremap <expr> <CR> getcmdtype() =~ '[?/]' ? '<CR>zz' : '<CR>'
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" shift line up or down
nnoremap <silent> <C-j> :m +1<CR>
nnoremap <silent> <C-k> :m -2<CR>
