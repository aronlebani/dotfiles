" ---- Custom filetype detection ----

if did_filetype()
    finish
endif

if getline(1) =~ '^#!.*/usr/bin/sbcl'
    setfiletype lisp
elseif getline(1) =~ '^#!.*/usr/bin/racket'
    setfiletype scheme
endif
