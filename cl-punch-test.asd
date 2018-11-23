#|
  This file is a part of cl-punch project.
  Copyright (c) 2018 Windymelt
|#

(in-package :cl-user)
(defpackage cl-punch-test-asd
  (:use :cl :asdf))
(in-package :cl-punch-test-asd)

(defsystem cl-punch-test
  :author "Windymelt"
  :license "MIT"
  :depends-on (:cl-punch
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "cl-punch"))))
  :description "Test system for cl-punch"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
