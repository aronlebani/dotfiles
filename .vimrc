" ---- Plugins ----

call        plug#begin()
Plug        'preservim/nerdtree'                    " File browser
Plug        'Xuyuanp/nerdtree-git-plugin'           " Git for nerdtree
Plug        'airblade/vim-gitgutter'                " Git gutter
Plug        'tpope/vim-commentary'                  " Block commenting
Plug        'vim-airline/vim-airline'               " Status bar
Plug        'dense-analysis/ale'                    " Linter
Plug        'mileszs/ack.vim'                       " Ack for vim
Plug        'kovisoft/slimv'                        " Slime integration
" Syntax highlighting
Plug        'pangloss/vim-javascript'               " JS lang
Plug        'mxw/vim-jsx'                           " JSX lang
Plug        'plasticboy/vim-markdown'               " Markdown lang
Plug        'rust-lang/rust.vim'                    " Rust lang
Plug        'fatih/vim-go', { 'do': ':GoUpdateBinaries' }   " Golang
" Colour themes
Plug        'liuchengxu/space-vim-dark'
Plug        'tomasiser/vim-code-dark'
Plug        'aronlebani/vim-colors-plain'
call        plug#end()

" ---- Basics ----

set         nocompatible
set         showmatch	                            " Show matching brackets
set         backspace=2	                            " Makes backspace behave as expected
set         hlsearch	                            " Highlighting for search
set         ruler	                                " Show cursor line and column position
set         number                                  " Show line numbers
set         noswapfile                              " Disable swap files
set         colorcolumn=100                         " Vertical ruler
set         autoread                                " Reload externally modified files
set         ignorecase                              " Required for smartcase to work
set         smartcase                               " Case sensitive if uppercase, else case insensitive
set         so=999                                  " Keep cursor vertically centered where possible
set         wrap!                                   " Text wrapping
set         tabstop=4                               " Tabs
set         softtabstop=4
set         shiftwidth=4
set         expandtab
set         smarttab

" ---- Colour scheme ----

syntax      on
colorscheme plain

" ---- Key maps ----

inoremap    jj <esc>
nnoremap    <c-j> <c-w><c-j>
nnoremap    <c-k> <c-w><c-k>
nnoremap    <c-l> <c-w><c-l>
nnoremap    <c-h> <c-w><c-h>
nnoremap    ff :noh<cr><cr>
nnoremap    gr :call ExecuteCommand()<cr>
inoremap    ,now ## <c-r>=strftime("%F")<c-m>
nnoremap    cc :center<cr>
map         <c-t> :terminal<cr>
map         <c-n> :NERDTreeToggle<cr>

" ---- Autocomplete braces ----

inoremap    {<cr> {<cr>}<esc>ko
inoremap    [<cr> [<cr>]<esc>ko
inoremap    (<cr> (<cr>)<esc>ko

" ---- Settings by language ----

autocmd     FileType javascript setlocal ts=2 sts=2 sw=2
autocmd     FileType javascript.jsx setlocal ts=2 sts=2 sw=2
autocmd     FileType scss setlocal ts=2 sts=2 sw=2
autocmd     FileType json setlocal ts=2 sts=2 sw=2
autocmd     FileType yaml setlocal ts=2 sts=2 sw=2
autocmd     FileType html setlocal ts=2 sts=2 sw=2
autocmd     FileType svelte setlocal ts=2 sts=2 sw=2
autocmd     FileType type call Type()
autocmd     FileType markdown setlocal wrap
autocmd     FileType gitcommit setlocal spell
autocmd     FileType lisp colorscheme plain

" ---- Functions ----

" Execute shell command between backticks
function ExecuteCommand()
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

" Typewriter mode
function Type()
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
    imap <BS> <nop>
    imap <c-h> <nop>

    imap <c-q> <cmd>:confirm q<CR>
    imap <c-s> <cmd>:update<CR>
endfunction

" ---- Plugin specific settings ----

" space-vim-dark
let g:space_vim_dark_background = 233

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'~',
    \ 'Staged'    :'+',
    \ 'Untracked' :'+',
    \ 'Ignored'   :'*',
    \ 'Deleted'   :'-',
    \ 'Renamed'   :'>',
    \ 'Unmerged'  :'═',
    \ 'Dirty'     :'~',
    \ 'Clean'     :' ',
    \ 'Unknown'   :'?',
    \ }

" vim-gitgutter
let g:gitgutter_sign_column_always = 1  " Always show gutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_removed_above_and_below = '-'
let g:gitgutter_sign_modified_removed = '~'

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_follow_anchor = 1

" ack.vim
if executable('rg')
    let g:ackprg = 'rg --vimgrep --no-heading'
endif

" Ale
let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ }
let g:ale_fixers = {
    \ 'javascript': ['prettier'],
    \ 'scss': ['prettier'],
    \ 'sql': ['pgformatter'],
    \ 'rust': ['rustfmt'],
    \ }

" vim-go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds' : ['p:package', 'i:imports:1', 'c:constants', 'v:variables', 't:types', 'n:interfaces', 'w:fields', 'e:embedded', 'm:methods', 'r:constructor', 'f:functions'],
    \ 'sro' : '.',
    \ 'kind2scope' : {'t' : 'ctype', 'n' : 'ntype'},
    \ 'scope2kind' : {'ctype' : 't', 'ntype' : 'n'},
    \ 'ctagsbin' : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Slimv
let g:slimv_swank_cmd = '! xterm -e sbcl --load /home/aron/.vim/slimv/slime/start-swank.lisp &'
let g:slimv_lisp = '/usr/bin/sbcl'
let g:slimv_impl = 'sbcl'
