" ==============================================================================
" > Syntax highlight heredoc sections
" ==============================================================================
" Add it to ~/.vim/after/syntax/ruby.vim or ~/.config/nvim/after/syntax/ruby.vim
" Inspired by https://gist.github.com/Ikke/db0fc8fcd2d60e470348d71d8dad4a36

" Record current buffer syntax (ruby)
let s:cbs = b:current_syntax

" Reference desired syntaxes (unlets are mandatory)
unlet b:current_syntax | syntax include @HTML	syntax/html.vim
unlet b:current_syntax | syntax include @JS     syntax/javascript.vim
unlet b:current_syntax | syntax include @SH     syntax/sh.vim
unlet b:current_syntax | syntax include @SQL    syntax/sql.vim

" Recover ruby syntax
let b:current_syntax = s:cbs
unlet s:cbs

" Default heredoc highlight:
syntax region rubyHereDoc       matchgroup=Statement start=+<<[-~.]*\z([A-Z]\+\)+ end=+^\s*\z1+ contains=@rubyStringSpecial

" Allow ruby inception
syntax region rubyHereDocRuby	matchgroup=Statement start=+<<[-~.]*\z(RUBY\)+    end=+^\s*\z1+ contains=ALL
syntax region rubyHereDocErb    matchgroup=Statement start=+<<[-~.]*\z(ERB\)+     end=+^\s*\z1+ contains=ALL

" Define desired syntaxes
syntax region rubyHereDocHtml   matchgroup=Statement start=+<<[-~.]*\z(HTML\)+    end=+^\s*\z1+ contains=@HTML
syntax region rubyHereDocJs     matchgroup=Statement start=+<<[-~.]*\z(JS\)+      end=+^\s*\z1+ contains=@JS
syntax region rubyHereDocSh     matchgroup=Statement start=+<<[-~.]*\z(SH\)+      end=+^\s*\z1+ contains=@SH
syntax region rubyHereDocSql    matchgroup=Statement start=+<<[-~.]*\z(SQL\)+     end=+^\s*\z1+ contains=@SQL
