set nocompatible

" ---- Plugins ----

call plug#begin()
Plug 'dense-analysis/ale'           " Linter
Plug 'kovisoft/slimv'               " Slime integration
Plug 'pangloss/vim-javascript'      " JS lang
Plug 'mxw/vim-jsx'                  " JSX lang
Plug 'plasticboy/vim-markdown'      " Markdown lang
Plug 'rust-lang/rust.vim'           " Rust lang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }   " Golang
call plug#end()

" ---- Settings ----

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
set so=999                          " Keep cursor vertically centered where possible
set nowrap                          " Text wrapping
set tabstop=4                       " Tabs
set softtabstop=4
set shiftwidth=4
set wildmenu
set laststatus=2                    " Always show status line

if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --no-heading
  set grepformat=%f:%l:%c:%m
endif

" ---- Key maps ----

inoremap jj <esc>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>
nnoremap ff :noh<cr><cr>
nnoremap gr :call ExecuteCommand()<cr>
inoremap ,now ## <c-r>=strftime("%F")<c-m>
nnoremap cc :center<cr>
noremap  <c-t> :terminal<cr>
nnoremap <f8> :call SynStack()<cr>
tnoremap <c-b> <c-\><c-n>
nnoremap <c-i> :cwindow<cr>
inoremap {<cr> {<cr>}<esc>ko
inoremap [<cr> [<cr>]<esc>ko
inoremap (<cr> (<cr>)<esc>ko

" ---- Settings by language ----

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType javascript.jsx setlocal ts=2 sts=2 sw=2
autocmd FileType scss setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType type call Type()
autocmd FileType markdown setlocal wrap
autocmd FileType gitcommit setlocal spell

" ---- Syntax highlighting ----

colorscheme default

highlight Comment ctermbg=NONE ctermfg=darkcyan cterm=italic

highlight Constant ctermfg=cyan
highlight link Character Constant
highlight link Number Constant
highlight link Boolean Constant
highlight link Float Constant 
highlight link String Constant

highlight Statement ctermfg=NONE cterm=bold
highlight link Conditonal Statement
highlight link Repeat Statement
highlight link Label Statement
highlight link Keyword Statement
highlight link Exception Statement

highlight Identifier ctermfg=NONE cterm=NONE

highlight Type ctermfg=NONE
highlight link StorageClass Type
highlight link Structure Type
highlight link Typedef Type

highlight Special ctermfg=NONE
highlight link SpecialChar Special
highlight link Tag Special
highlight link Delimiter Special
highlight link SpecialComment Special
highlight link Debug Special

highlight PreProc ctermfg=NONE
highlight link Include PreProc
highlight link Define PreProc
highlight link Macro PreProc
highlight link PreCondit PreProc

highlight Title ctermfg=white cterm=bold
highlight Underlined ctermfg=NONE cterm=underline
highlight Todo ctermbg=yellow cterm=bold
highlight Directory ctermfg=cyan ctermbg=NONE

highlight Error ctermbg=red ctermfg=NONE cterm=bold
highlight Warning ctermfg=yellow
highlight MatchParen ctermfg=NONE ctermbg=yellow
highlight Search ctermbg=yellow ctermfg=darkgrey
highlight Cursor ctermbg=NONE ctermfg=NONE cterm=NONE
highlight CursorLine ctermbg=blue ctermfg=NONE cterm=NONE
highlight link CursorLineNr CursorLine
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

" ---- Functions ----

function ExecuteCommand()
    " Execute shell command between backticks
    let l:save_clipboard = &clipboard
    set clipboard= " Avoid clobbering the selection and clipboard registers.
    let l:save_reg = getreg('"')
    let l:save_regmode = getregtype('"')
    normal! yi`
    let l:text = @@ " Your text object contents are here.
    call setreg('"', l:save_reg, l:save_regmode)
    let &clipboard = l:save_clipboard
    silent execute "!" . l:text
    redraw!
endfunction

function Type()
    " Typewriter mode
    set insertmode

    " Disable the normal-mode escape (in insertmode)
    imap <c-l> <nop>

    " Disable the one-func insert-mode escape
    imap <c-o> <nop>

    " Disable the direction keys
    imap <left> <nop>
    imap <right> <nop>
    imap <up> <nop>
    imap <down> <nop>

    " Disable the various forms of deletion
    imap <c-u> <nop>
    imap <c-w> <nop>
    imap <bs> <nop>
    imap <c-h> <nop>

    imap <c-q> <cmd>:confirm q<cr>
    imap <c-s> <cmd>:update<cr>
endfunction

function SynStack ()
    " Check highlight group
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction
