set nocompatible

" ---- Plugins ----

call plug#begin()
" Plugins
Plug 'tpope/vim-fugitive'
Plug 'kovisoft/slimv'
" Syntax
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jaawerth/fennel.vim'
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
let maplocalleader = "\\"

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
nnoremap <localleader>c :center<cr>
nnoremap <localleader>h :noh<cr><cr>
nnoremap <localleader>n :bnext<cr>
nnoremap <localleader>p :bprevious<cr>
inoremap <localleader>d ## <c-r>=strftime("%F")<c-m>
nnoremap <localleader>s :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
nnoremap gr yy:!@"<cr>

" ---- Settings by language ----

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType scss setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType htmldjango setlocal ts=2 sts=2 sw=2
autocmd FileType markdown setlocal wrap

" ---- Plugin settings ----

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_follow_anchor = 1

let g:slimv_repl_split = 3
let g:slimv_package = 1

let g:netrw_preview = 1

" ---- Colours ----

colorscheme default

highlight Comment ctermbg=NONE ctermfg=darkgrey cterm=italic
highlight Statement ctermfg=NONE cterm=bold
highlight PreProc ctermfg=NONE cterm=bold
highlight Constant ctermfg=lightgreen
highlight Identifier ctermfg=blue
highlight Type ctermfg=NONE
highlight Special ctermfg=blue
highlight LineNr ctermfg=darkgrey
highlight VertSplit ctermbg=NONE ctermfg=darkgrey cterm=NONE
highlight Title ctermfg=NONE cterm=bold
highlight lispParen ctermfg=darkgrey
