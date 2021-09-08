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

" ---- Key maps ----

inoremap jj <Esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <C-t> :terminal<CR>

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

" ---- Spell check by language ---- 

" autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

autocmd FileType markdown setlocal wrap

" ---- Language specific settings ----

" Golang
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" ---- Functions ----

" Execute shell command between backticks
fu ExecuteCommand()
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
endfu

nnoremap gr :call ExecuteCommand()<CR>

" ---- Plugins ----

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
let g:gitgutter_sign_modified_removed = '-'

" vim-prettier
let g:prettier#autoformat_require_pragma = 1    " Only format files with @format or @prettier

" open-browser
let g:netrw_nogx = 1    " Disable netrw's gx mapping
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_level = 2
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_follow_anchor = 1

" vim-plug
call plug#begin()
Plug 'sainnhe/sonokai'                  " Color theme
Plug 'liuchengxu/space-vim-dark'        " Color theme
Plug 'mxw/vim-jsx'                      " JSX syntax
Plug 'pangloss/vim-javascript'          " JS syntax
Plug 'othree/html5.vim'                 " HTML syntax
Plug 'fsharp/vim-fsharp'                " F# syntax
Plug 'preservim/nerdtree'               " File browser
Plug 'Xuyuanp/nerdtree-git-plugin'      " Git for nerdtree
Plug 'airblade/vim-gitgutter'           " Git gutter
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy search
Plug 'tpope/vim-commentary'             " Block commenting
Plug 'vim-airline/vim-airline'          " Status bar
Plug 'tpope/vim-fugitive'               " Git plugin
Plug 'nelstrom/vim-visual-star-search'  " Search by entire selected text
Plug 'prettier/vim-prettier', { 'do': 'npm install' }   " Prettier
Plug 'tyru/open-browser.vim'            " Use gx to open url in browser or smart search
Plug 'dense-analysis/ale'               " Linter
Plug 'plasticboy/vim-markdown'          " Markdown
call plug#end()

colorscheme space-vim-dark              " This needs to be set after declaring the plugin
