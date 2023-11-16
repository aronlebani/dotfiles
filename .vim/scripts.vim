" ---- Custom filetype detection ----

if did_filetype()
    finish
endif
if getline(1) =~ '^#!.*/usr/bin/sbcl'
    setfiletype lisp
endif
