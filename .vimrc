set nocompatible

set showmatch
set backspace=2
set hlsearch
set ruler
set number
set noswapfile
set colorcolumn=100
set autoread
set ignorecase
set smartcase
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4

inoremap jj <esc>

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType scss setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType markdown setlocal wrap
