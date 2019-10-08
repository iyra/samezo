(defpackage samezo
  (:use :cl :cl-ppcre)
  (:export :hello))
(in-package :samezo)

;; blah blah blah.
(defun hello (x)
  (let ((ptrn (ppcre:create-scanner "(a)*b")))
  (ppcre:scan ptrn "xaaabd")))
