(defun exists? (value)
  ; Checks whether the given value exists.
  (and value (not (eql value :unspecific))))

(defun path-is-directory? (path)
  ; Checks if the given pathname is a directory.
  (and
    (not (exists? (pathname-name path)))
    (not (exists? (pathname-type path)))
    path))

(defun path-to-directory (path)
  ; Converts a pathname to directory form.
  (let ((pathname (pathname path)))
    (when (wild-pathname-p pathname)
      (error "Can't reliably convert wild pathnames."))
    (if (not (path-is-directory? path))
      (make-pathname
        :directory (append (or (pathname-directory pathname) (list :relative))
                           (list (file-namestring pathname)))
        :name nil
        :type nil
        :defaults pathname)
      pathname)))

(defun path-to-wildcard (path)
  ; Returns a wildcard pathname for the given pathname.
  (make-pathname
    :name :wild
    :type :wild
    :defaults (path-to-directory path)))

(defun path-list (path)
  ; Lists the contents of the given pathname.
  (when (wild-pathname-p path)
    (error "Can only list concrete directory names."))
  (directory (path-to-wildcard path)))

(defun walk-directory (path &key file-fn directory-fn (test (constantly t)))
  ; Walk a directory tree. Applies the provided function on all pathnames under the directory. If
  ; :test is provided, only calls the function on the pathnames where :test returns true.
  (labels
    ((walk (name)
      (cond
        ((path-is-directory? name)
          (if (and directory-fn (funcall test name))
            (funcall directory-fn name))
          (dolist (x (path-list name)) (walk x)))
        (t
          (if (and file-fn (funcall test name))
            (funcall file-fn name))))))
    (walk (path-to-directory path))))
