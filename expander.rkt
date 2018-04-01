#lang br/quicklang

(require json)

(define-macro (jsonic-module-begin PARSE-TREE)
  #'(#%module-begin
     (define result-string PARSE-TREE)
     (define validated-jsexpr (string->jsexpr result-string))
     (display result-string)))
(provide (rename-out [jsonic-module-begin #%module-begin]))

(define-macro (jsonic-program SEXP-OR-JSON-STR ...)
  #'(string-trim (string-append SEXP-OR-JSON-STR ...)))
(provide jsonic-program)

(define-macro (jsonic-char CHAR-TOK-VALUE)
  #'CHAR-TOK-VALUE)
(provide jsonic-char)

(define-macro (jsonic-sexp SEXP-STR)
  (with-pattern ([SEXP-DATUM (format-datum '~a #'SEXP-STR)])
    #'(jsexpr->string SEXP-DATUM)))
(provide jsonic-sexp)

