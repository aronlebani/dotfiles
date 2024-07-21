set nocompatible

" ---- Plugins ----

call plug#begin()
" Plugins
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'kovisoft/slimv'
" Syntax
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" ---- Settings ----

set showmatch
set backspace=2
set hlsearch
set ruler
set number
set noswapfile
set colorcolumn=80
set autoread
set ignorecase
set smartcase
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wildmenu
set laststatus=2
set grepprg=rg\ --vimgrep\ --smart-case\ --no-heading
set grepformat=%f:%l:%c:%m

let mapleader = ","

" ---- Key maps ----

inoremap jj <esc>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>
tnoremap <c-j> <c-w><c-j>
tnoremap <c-k> <c-w><c-k>
tnoremap <c-l> <c-w><c-l>
tnoremap <c-h> <c-w><c-h>
noremap  <c-t> :terminal<cr>
tnoremap <c-b> <c-\><c-n>
nnoremap ;c :center<cr>
nnoremap ;h :noh<cr><cr>
nnoremap ;n :bnext<cr>
nnoremap ;p :bprevious<cr>
inoremap ;d ## <c-r>=strftime("%F")<c-m>
nnoremap ;s :echo "hi<".synIDattr(synID(line("."),col("."),1),"name")."> trans<".synIDattr(synID(line("."),col("."),0),"name")."> lo<".synIDattr(synIDtrans(synID(line("."),col("."),1)),"name").">"<cr>
nnoremap gr yy:!@"<cr>

" ---- Settings by language ----

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType scss setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType markdown setlocal wrap

" ---- Plugin settings ----

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_follow_anchor = 1

let g:ale_linters_explicit = 1
let g:ale_linters = { 'javascript': ['eslint'], 'ruby': ['rubocop'], 'html': ['tidy'], 'sh': ['shellcheck'] }
let g:ale_fixers = { 'javascript': ['prettier'], 'scss': ['prettier'], 'rust': ['rustfmt'] }
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_set_highlights = 0

let g:slimv_repl_split = 3
let g:slimv_package = 1

let g:netrw_preview = 1
