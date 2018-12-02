(in-package :cl-user)
(defpackage cl-punch
  (:use :cl)
  (:export :punch-reader :enable-punch-syntax))
(in-package :cl-punch)

(defun punch-reader (s c)
  "A reader which converts _ into lambda argument, <_ into last lambda argument."
  (declare (ignorable c))
  (let ((form (read s nil nil t))
        (arg-symbol-list nil))
    (labels ((replace-underscore (x)
               (cond
                 ((and (symbolp x) (string= (symbol-name x) "_!"))
                  (let ((sym (gensym)))
                    (if (null arg-symbol-list)
                        (push sym arg-symbol-list)
                        (push sym (cdr (last arg-symbol-list))))
                    sym))
                 ((and (symbolp x) (string= (symbol-name x) "_"))
                  (let ((sym (gensym)))
                    (push sym arg-symbol-list)
                    sym))
                 ((and (symbolp x) (string= (symbol-name x) "<_"))
                  (first arg-symbol-list))
                 ((listp x) (mapcar #'replace-underscore x))
                 ('otherwise x))))
      (let ((result-inner-form (mapcar #'replace-underscore form)))
        `(lambda ,(nreverse arg-symbol-list) ,result-inner-form)))))

(cl-syntax:defsyntax punch-syntax
  (:macro-char #\^ #'punch-reader))

(defmacro enable-punch-syntax ()
  '(eval-when (:compile-toplevel :load-toplevel :execute)
    (cl-syntax:use-syntax punch-syntax)))
