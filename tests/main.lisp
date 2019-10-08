(defpackage samezo/tests/main
  (:use :cl
        :samezo
        :rove))
(in-package :samezo/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :samezo)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
