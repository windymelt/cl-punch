(in-package :cl-user)
(defpackage cl-punch-test
  (:use :cl
        :cl-punch
        :prove))
(in-package :cl-punch-test)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-punch)' in your Lisp.

(plan 5)

(enable-punch-syntax)

(is (^(* _ 2) 2) 4)

(is (mapcar ^(* _ 3) '(1 2 3))
    '(3 6 9))

(is (^(* _ _) 2 3) 6)

(is (mapcar ^(if (oddp _) (* 2 <_) <_)
            '(1 2 3 4 5))
    '(2 2 6 4 10))

(is (^(cons _ _!) :a :b) '(:b . :a))

(finalize)
