set nocompatible

" ---- Plugins ----

call plug#begin()
" Plugins
Plug 'dense-analysis/ale'
Plug 'kovisoft/slimv'
" Syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
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
set colorcolumn=100
set autoread
set ignorecase
set smartcase
set so=999
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wildmenu
set laststatus=2
set grepprg=rg\ --vimgrep\ --smart-case\ --no-heading
set grepformat=%f:%l:%c:%m

let mapleader = ";"

" ---- Key maps ----

inoremap jj <esc>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>
noremap  <c-t> :terminal<cr>
tnoremap <c-b> <c-\><c-n>
nnoremap <c-o> :copen<cr>
inoremap {<cr> {<cr>}<esc>ko
inoremap [<cr> [<cr>]<esc>ko
inoremap (<cr> (<cr>)<esc>ko
nnoremap <leader>c :center<cr>
nnoremap <leader>h :noh<cr><cr>
nnoremap <leader>n :bnext<cr>
nnoremap <leader>p :bprevious<cr>
inoremap <leader>d ## <c-r>=strftime("%F")<c-m>
nnoremap <leader>s :echo "hi<".synIDattr(synID(line("."),col("."),1),"name")."> trans<".synIDattr(synID(line("."),col("."),0),"name")."> lo<".synIDattr(synIDtrans(synID(line("."),col("."),1)),"name").">"<cr>

" ---- Settings by language ----

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType javascript.jsx setlocal ts=2 sts=2 sw=2
autocmd FileType scss setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType markdown setlocal wrap
autocmd FileType markdown highlight htmlItalic ctermfg=blue cterm=italic
autocmd FileType markdown highlight mkdItalic ctermfg=blue cterm=italic
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" ---- Syntax highlighting ----

colorscheme default

highlight Comment ctermbg=NONE ctermfg=darkgrey cterm=italic
highlight Statement ctermfg=29 cterm=bold
highlight Constant ctermfg=darkblue
highlight Directory ctermfg=darkblue ctermbg=NONE
highlight Identifier ctermfg=NONE cterm=NONE
highlight Type ctermfg=NONE
highlight Special ctermfg=NONE
highlight PreProc ctermfg=NONE
highlight Underlined ctermfg=NONE cterm=underline
highlight Title ctermfg=NONE cterm=bold
highlight Todo ctermbg=yellow cterm=bold
highlight Error ctermbg=NONE ctermfg=red cterm=underline
highlight Warning ctermfg=yellow
highlight SpellBad ctermfg=NONE ctermbg=NONE cterm=underline ctermul=red
highlight MatchParen ctermfg=NONE ctermbg=blue
highlight Search ctermbg=lightmagenta ctermfg=NONE
highlight Visual ctermbg=lightmagenta ctermfg=NONE
highlight Cursor ctermbg=NONE ctermfg=NONE cterm=NONE
highlight VertSplit ctermbg=NONE ctermfg=NONE cterm=NONE
highlight LineNr ctermbg=NONE ctermfg=NONE
highlight ColorColumn ctermbg=darkgrey
highlight SignColumn ctermbg=NONE

" ---- Plugin settings ----

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_follow_anchor = 1

let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_fixers = { 'javascript': ['prettier'], 'scss': ['prettier'], 'rust': ['rustfmt'] }

let g:slimv_swank_cmd = '! xterm -e sbcl --load /home/aron/.vim/plugged/slimv/slime/start-swank.lisp &'
let g:slimv_lisp = '/usr/bin/sbcl'
let g:slimv_impl = 'sbcl'
