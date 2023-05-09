" ---- Plugins ----

call plug#begin()
Plug 'liuchengxu/space-vim-dark'            " Color theme
Plug 'mxw/vim-jsx'                          " JSX syntax
Plug 'pangloss/vim-javascript'              " JS syntax
Plug 'othree/html5.vim'                     " HTML syntax
Plug 'fsharp/vim-fsharp'                    " F# syntax
Plug 'evanleck/vim-svelte'                  " Svelte
Plug 'preservim/nerdtree'                   " File browser
Plug 'Xuyuanp/nerdtree-git-plugin'          " Git for nerdtree
Plug 'airblade/vim-gitgutter'               " Git gutter
Plug 'tpope/vim-commentary'                 " Block commenting
Plug 'vim-airline/vim-airline'              " Status bar
Plug 'tpope/vim-fugitive'                   " Git plugin
Plug 'prettier/vim-prettier'                " Prettier
Plug 'tyru/open-browser.vim'                " Use gx to open url in browser or smart search
Plug 'dense-analysis/ale'                   " Linter
Plug 'plasticboy/vim-markdown'              " Markdown
Plug 'OmniSharp/omnisharp-vim'              " C# stuff
Plug 'mileszs/ack.vim'                      " Ack for vim
call plug#end()

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
set ignorecase                              " Required for smartcase to work
set smartcase                               " Case sensitive if uppercase, else case insensitive
set so=999                                  " Keep cursor vertically centered where possible
autocmd InsertEnter,InsertLeave * set cul!  " Toggle cursor line in insert mode

" ---- Colour scheme ----

set termguicolors
set background=dark
syntax on
colorscheme space-vim-dark

" ---- Key maps ----

inoremap jj <Esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <C-t> :terminal<CR>
tnoremap <C-b> <C-w>N
nnoremap ff :noh<CR><CR>
nnoremap gr :call ExecuteCommand()<CR>

" ---- Autocomplete braces ----

inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko
inoremap (<CR> (<CR>)<Esc>ko

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
autocmd FileType scss setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType svelte setlocal ts=2 sts=2 sw=2
autocmd FileType type call Type()
autocmd FileType markdown setlocal wrap     " Wrap text       
autocmd FileType gitcommit setlocal spell

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

" NERDTree
map <C-n> :NERDTreeToggle<CR>
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

" vim-prettier
let g:prettier#autoformat_require_pragma = 1    " Only format files with @format or @prettier

" open-browser
let g:netrw_nogx = 1    " Disable netrw's gx mapping
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_follow_anchor = 1

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
