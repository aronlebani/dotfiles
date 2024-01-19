set nocompatible

set showmatch	                    " Show matching brackets
set backspace=2	                    " Makes backspace behave as expected
set hlsearch	                    " Highlighting for search
set ruler	                        " Show cursor line and column position
set number                          " Show line numbers
set noswapfile                      " Disable swap files
set colorcolumn=100                 " Vertical ruler
set autoread                        " Reload externally modified files
set ignorecase                      " Required for smartcase to work
set smartcase                       " Case sensitive if uppercase, else case insensitive
set nowrap                          " Text wrapping
set tabstop=4                       " Tabs
set softtabstop=4
set shiftwidth=4

inoremap jj <esc>

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType javascript.jsx setlocal ts=2 sts=2 sw=2
autocmd FileType scss setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType markdown setlocal wrap
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
