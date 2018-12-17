# Cl-Punch - Scala-like anonymous lambda literal

[![Quicklisp](http://quickdocs.org/badge/cl-punch.svg)](http://quickdocs.org/cl-punch/)

## Usage

```
;; Enable syntax.
(cl-punch:enable-punch-syntax)

;; ^() is converted into (lambda ...) .
;; Each underscore is converted into a lambda argument.

(mapcar ^(* 2 _) '(1 2 3 4 5))
;; => '(2 4 6 8 10)

;; One underscore corresponds one argument.

(^(* _ _) 2 3)
;; => 6

;; <_ reuses last argument.

(mapcar ^(if (oddp _) (* 2 <_) <_) '(1 2 3 4 5))
;; => '(2 2 6 4 10)

;; _! corresponds one argument but it is brought to top of the argument list.
;; It can be useful when you want to change argument order.

(^(cons _ _!) :a :b)
;; => (:b . :a)

(^(list _! _! _!) 1 2 3)
;; => '(3 2 1)
```

## Installation

WIP: Register to quicklisp

## Author

* Windymelt

## Copyright

Copyright (c) 2018 Windymelt

## License

Licensed under the MIT License.
