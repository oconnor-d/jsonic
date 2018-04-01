#lang br

(require jsonic/parser
         jsonic/tokenizer
         brag/support
         rackunit)

; String -> Datum
; Parses the given program using the jsonic parser.
(define (parse program)
  (parse-to-datum
   (apply-tokenizer-maker make-tokenizer program)))

(check-equal?
 (parse "// line comment\n")
 '(jsonic-program))

(check-equal?
 (parse "@$ 42 $@")
 '(jsonic-program (jsonic-sexp " 42 ")))

(check-equal?
 (parse "hi")
 '(jsonic-program
   (jsonic-char "h")
   (jsonic-char "i")))

(check-equal?
 (parse "hi\n//c comment\n@$ 42 $@")
 '(jsonic-program
   (jsonic-char "h")
   (jsonic-char "i")
   (jsonic-char "\n")
   (jsonic-sexp " 42 ")))