let b:is_chicken=1

setlocal lispwords+=let-values,condition-case,with-input-from-string
setlocal lispwords+=with-output-to-string,handle-exceptions,call/cc,rec,receive
setlocal lispwords+=call-with-output-file
setlocal keywordprg=chicken-doc\ scheme
