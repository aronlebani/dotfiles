set nocompatible

" ---- Settings ----

syntax on
filetype plugin indent on
colorscheme default

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
tnoremap <c-b> <c-\><c-n>
nnoremap <localleader>c :center<cr>
nnoremap <localleader>h :noh<cr><cr>
nnoremap <localleader>n :bnext<cr>
inoremap <localleader>d ## <c-r>=strftime("%F")<c-m>
nnoremap <localleader>p :bprevious<cr>
nnoremap <localleader>s :call SynStack()<cr>
vnoremap <enter> :<c-u>call EvalVisual()<cr>:<bs>

" ---- Settings by language ----

autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType htmldjango setlocal ts=2 sts=2 sw=2
autocmd FileType eruby setlocal ts=2 sts=2 sw=2
autocmd FileType markdown setlocal wrap

" ---- Plugin settings ----

let g:slimv_repl_split = 3
let g:slimv_package = 1
let g:netrw_preview = 1
let g:repls = {"ruby": "irb", "sh": "bash", "lisp": "rlwrap sbcl"}

" ---- Colours ----

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

" ---- Functions ----

function GetVisualSelection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)

    if len(lines) == 0
        return ""
    endif

    let lines[-1] = lines[-1][: column_end - (&selection == "inclusive" ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]

    return join(lines, "\n")
endfunction

function SendTerm(str)
	let repl = g:repls[&filetype]
    let bnrs = term_list()

    if len(bnrs) > 0
        call term_sendkeys(bnrs[0], a:str)
    else
		let bnr = term_start(repl)
        call term_sendkeys(bnr, a:str)
    endif
endfunction

function EvalVisual()
    let data = GetVisualSelection() . "\<cr>"

	call SendTerm(data)
endfunction

function EvalFile()
	let filename = expand("%:t")

	if &filetype == "ruby"
		call SendTerm("load '" . filename . "'" . "\<cr>")
	elseif &filetype == "sh"
		call SendTerm("source " . filename . "\<cr>")
	elseif &filetype == "lisp"
		call SendTerm("(load \"" . filename . "\")\<cr>a")
	endif
endfunction

function SynStack()
	let s = synID(line("."), col("."), 1)

	echo synIDattr(s, "name") . " -> " . synIDattr(synIDtrans(s), "name")
endfunction
