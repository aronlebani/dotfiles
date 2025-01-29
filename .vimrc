set nocompatible
syntax enable
filetype plugin indent on

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
set noexpandtab
set path+=**
set wildmenu
set laststatus=2
set grepprg=rg\ --vimgrep\ --smart-case\ --no-heading
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+ " `:set list` to use
set scrolloff=3

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
tnoremap <c-b> <c-\><c-n>
nnoremap <localleader>h :noh<cr><cr>
nnoremap <localleader>n :bnext<cr>
nnoremap <localleader>p :bprevious<cr>
inoremap <localleader>d ## <c-r>=strftime("%F")<c-m>
nnoremap <localleader>s :call SynStack()<cr>

" ---- Settings by language ----

autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType eruby setlocal ts=2 sts=2 sw=2
autocmd FileType htmldjango setlocal ts=2 sts=2 sw=2
autocmd FileType markdown setlocal wrap
autocmd FileType mail setlocal textwidth=0
autocmd FileType eruby let g:surround_45 = "<% \r %>" " -
autocmd FileType eruby let g:surround_61 = "<%= \r %>"	" =
autocmd FileType php let g:surround_45 = "<php? \r ?>" " -
autocmd FileType php let g:surround_61 = "<?= \r ?>" " =

" ---- Plugin settings ----

let g:slimv_repl_split = 3
let g:slimv_package = 1
let g:netrw_liststyle = 3
let g:ruby_recommended_style = 0

" ---- Colours ----

colorscheme solarized

" ---- Enable built-in packages ----

packadd comment

" ---- funcs ----

func SynStack()
	let s = synID(line("."), col("."), 1)

	echo synIDattr(s, "name") . " -> " . synIDattr(synIDtrans(s), "name")
endf

