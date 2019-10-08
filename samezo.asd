(defsystem "samezo"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("cl-ppcre")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "samezo/tests"))))

(defsystem "samezo/tests"
  :author ""
  :license ""
  :depends-on ("samezo"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for samezo"
  :perform (test-op (op c) (symbol-call :rove :run c)))
