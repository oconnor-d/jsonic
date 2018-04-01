#lang br

(require racket/draw)

(define (button-callback drr-window)
  (define expr-string "@$ $@")
  (define editor (send drr-window get-definitions-text))
  (send editor insert expr-string)
  (define pos (send editor get-start-position))
  (send editor set-position (- pos 3)))

(define our-jsonic-button
  (list "Insert JSONic Expression"
        (make-object bitmap% 16 16)
        button-callback
        #f))

(provide button-list)
(define button-list (list our-jsonic-button))