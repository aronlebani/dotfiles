;;;; util.lisp
;;;;
;;;; A collection of utility functions for Common Lisp.
;;;; Works with sbcl, untested with other implementations.
;;;; 
;;;; These utilities are intended to be small and require little to no maintenance, so that they
;;;; can simply be copy-pasted into the source files that use them.

;;; Common macros

(defmacro with-gensyms ((&rest names) &body body)
  "Binds each named variable to a gensymed symbol."
  `(let ,(loop for n in names collect `(,n (gensym)))
     ,@body))

;;; Static type-checking

(deftype -> (args &optional values)
  "The type of a function from ARGS to VALUES."
  `(function ,args ,@(when values
                       (list values))))

(defmacro -> (function (&rest args) &optional values)
  "Declaim the ftype of FUNCTION from ARGS to VALUES.

   Examples:
   
   (-> add (integer integer) integer)
   (defun add (x y) (+ x y))"
  `(declaim (ftype (-> (,@args) ,@(when values
                                    (list values)))
                   ,function)))

;;; Aliasing

(defmacro defalias (new-name prev-name)
  "Define a function alias

   Examples:

   (defalias ls directory-files)"
  `(defmacro ,new-name (&rest args)
     `(,',prev-name ,@args)))

;;; Calculations

(defun rgb->hex (r g b &key pretty?)
  "Convert an RGB value to hex. If 'pretty?' is 't', the result is pretty-printed."
  (let ((out `(,(format nil "~X" r) ,(format nil "~X" g) ,(format nil "~X" b))))
    (if pretty?
        (format nil "#~X~X~X" (first out) (second out) (third out))
        out)))

(defun px->rem (px &key pretty?)
  "Convert a value in units of pixels to units of rem. If 'pretty?' is 't', the
   result is pretty-printed."
  (let ((out (float (/ px 16))))
    (if pretty?
        (format nil "~arem" out) 
        out)))
