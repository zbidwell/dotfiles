set nocompatible
syntax on
set hidden
set mouse=a
set nowrap
set encoding=utf8

set number
set relativenumber
set colorcolumn=100

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
    Plug 'morhetz/gruvbox'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' } 
    let g:LanguageClient_serverCommands = { 'rust': ['rust-analyzer'] }

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1

    Plug 'itchyny/lightline.vim'

    Plug 'dag/vim-fish'

    Plug 'deoplete-plugins/deoplete-jedi'

    Plug 'tpope/vim-commentary'
call plug#end()

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
highlight Normal ctermbg=none
let g:lightline = { 'colorscheme': 'gruvbox' }

" fzf ripgrep search
nnoremap <silent> <Leader>r :Rg<CR>
" fzf file search
nnoremap <silent> <Leader>f :Files<CR>

" tab support for autocomplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

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

" shift lines up or down
nnoremap <silent> <C-j> :m +1<CR>
nnoremap <silent> <C-k> :m -2<CR>
