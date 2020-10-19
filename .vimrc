" ---- Basics ----

set nocompatible
:filetype on	                            " Turn on filetype detection
set showmatch	                            " Show matching brackets
set backspace=2	                            " Makes backspace behave as expected
set hlsearch	                            " Highlighting for search
set ruler	                                " Show cursor line and column position
set number                                  " Show line numbers
set noswapfile                              " Disable swap files
set colorcolumn=100                         " Vertical ruler
set autoread                                " Reload externally modified files
autocmd InsertEnter,InsertLeave * set cul!  " Toggle cursor line in insert mode

" ---- Colour scheme ----

set termguicolors
set background=dark
syntax on
colorscheme sonokai

" ---- Key maps ----

inoremap jj <Esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <C-t> :terminal<CR>

" ---- Autocomplete braces ----

inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>

" ---- Tab width ----

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" ---- Text wrapping ----

set wrap!

" ---- Tab settings by language ----

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType javascript.jsx setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2

" ---- Spell check by language ---- 

autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" ---- Language specific settings ----

" Golang
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" ---- Plugins ----

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'~',
    \ 'Staged'    :'+',
    \ 'Untracked' :'.',
    \ 'Ignored'   :'•',
    \ 'Deleted'   :'-',
    \ 'Renamed'   :'➜',
    \ 'Unmerged'  :'═',
    \ 'Dirty'     :'✗',
    \ 'Clean'     :'✔︎',
    \ 'Unknown'   :'?',
    \ }

" vim-gitgutter
let g:gitgutter_sign_column_always = 1  " Always show gutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_removed_above_and_below = '-'
let g:gitgutter_sign_modified_removed = '-'

" vim-plug
call plug#begin()
Plug 'sainnhe/sonokai'                  " Color theme
Plug 'mxw/vim-jsx'                      " JSX syntax
Plug 'pangloss/vim-javascript'          " JS syntax
Plug 'othree/html5.vim'                 " HTML syntax
Plug 'preservim/nerdtree'               " File browser
Plug 'Xuyuanp/nerdtree-git-plugin'      " Git for nerdtree
Plug 'airblade/vim-gitgutter'           " Git gutter
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy search
Plug 'tpope/vim-commentary'             " Block commenting
Plug 'vim-airline/vim-airline'          " Status bar
Plug 'tpope/vim-fugitive'               " Git plugin
Plug 'nelstrom/vim-visual-star-search'  " Search by entire selected text
call plug#end()
