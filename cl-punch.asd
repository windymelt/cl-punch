#|
  This file is a part of cl-punch project.
  Copyright (c) 2018 Windymelt
|#

#|
  Scala-like anonymous lambda literal

  Author: Windymelt
|#

(in-package :cl-user)
(defpackage cl-punch-asd
  (:use :cl :asdf))
(in-package :cl-punch-asd)

(defsystem cl-punch
  :version "0.2"
  :author "Windymelt"
  :license "MIT"
  :depends-on (:cl-syntax)
  :components ((:module "src"
                :components
                ((:file "cl-punch"))))
  :description "Scala-like anonymous lambda literal"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op cl-punch-test))))
