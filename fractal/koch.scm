;
; this is a sample program, and this is drawing koch
;
; hidekuno@gmail.com
;
(define (koch-demo)(draw-koch 4))

(define (koch-sicp-demo)
  ((transform-painter
    (koch 4)
    (make-vect 0.0 0.0)
    (make-vect 0.75 0.25)
    (make-vect 0.25 0.75)) frame))
