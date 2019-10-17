(defpackage samezo
  (:use :cl :cl-ppcre)
  (:export :hello))
(in-package :samezo)

(defun merge-list (a b)
  (reduce #'cons
                     a
                     :initial-value b
                     :from-end t))

(defun list-dir (path)
  (if (uiop:directory-exists-p path)
      (merge-list (uiop:subdirectories path) (uiop:directory-files path))
      '()))

(defun mark-if (thing starter ender test)
  (if test
      (concatenate 'string starter thing ender)
      thing))

(defun make-bar (path-seq cur-path)
  (let* ((path-string (concatenate 'string cur-path "/" (car path-seq) "/"))
	 (dir-contents (list-dir path-string))
	 (current-text ""))
    (if dir-contents
	       (loop
		  for it in dir-contents do
		    (setf current-text
			  (apply #'concatenate
				 (merge-list (list 'string current-text "<li>")
					     (if (or (equal (first (last (pathname-directory it))) (car (cdr path-seq))) ;; check if directory is same
						     (equal (file-namestring it) (car (cdr path-seq)))) ;; check if filename is same
						 (if (uiop:directory-exists-p it)
						     (list "<b>" (namestring it) "</b>" (string #\linefeed)
							   "<ul>" (make-bar (cdr path-seq) path-string) "</ul>")
						     (list "<b>" (namestring it) "</b>" "</li>" (string #\linefeed)))
						 (list (namestring it) "</li>" (string #\linefeed))))))
		  finally (return current-text))
	       ""))) ;; return nothing if empty dir
