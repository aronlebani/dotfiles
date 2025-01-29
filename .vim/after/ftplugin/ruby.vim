setlocal keywordprg=ri

command RubyLint !rubocop --format c %
command RubyTest !rspec --format f %

nnoremap <localleader>c :<c-u>call OpenRepl()<cr>:<bs>
vnoremap <localleader>e :<c-u>call EvalVisual()<cr>:<bs>
vnoremap <localleader>b :<c-u>call EvalFile()<cr>:<bs>
nnoremap <localleader>l :RubyLint<cr>
nnoremap <localleader>t :RubyTest<cr>

if &background == "dark"
	highlight rubyKeyword cterm=bold ctermfg=14 ctermbg=8
	highlight rubyConditional cterm=bold ctermfg=2 ctermbg=8
else
	highlight rubyKeyword cterm=bold ctermfg=10 ctermbg=15
	highlight rubyConditional cterm=bold ctermfg=2 ctermbg=15
end
highlight link rubyControl rubyKeyword
highlight link rubyException rubyKeyword
highlight link rubyExceptionHandler rubyKeyword

func OpenRepl()
    let bnrs = term_list()

    if len(bnrs) == 0
		let bnr = term_start("irb")
		return bnr
	else
		return bnrs[0]
    end
endf

func GetVisualSelection()
	let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)

    if len(lines) == 0
        return ""
    end

    let lines[-1] = lines[-1][: column_end - (&selection == "inclusive" ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]

    return join(lines, "\n")
endf

func EvalVisual()
    let data = GetVisualSelection() . "\<cr>"
	let bnr = OpenRepl()

    call term_sendkeys(bnr, data)
endf

func EvalFile()
	let filename = expand("%:t")
	let bnr = OpenRepl()

	if &filetype == "ruby"
		call term_sendkeys(bnr, "source '" . filename . "'" . "\<cr>")
	elseif &filetype == "sh"
		call term_sendkeys(bnr, "source " . filename . "\<cr>")
	elseif &filetype == "lisp"
		call term_sendkeys(bnr, "(load \"" . filename . "\")\<cr>")
	end
endf
