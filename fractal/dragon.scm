;
; this is a sample program, and this is drawing dragon-curve
;
; hidekuno@gmail.com
;
(define (dragon-curve-demo)(draw-dragon 12))

(define (dragon-curve-sicp-demo)
  ((transform-painter
    (dragon-curve 12)
    (make-vect 0.0 0.0)
    (make-vect 0.75 0.25)
    (make-vect 0.25 0.75)) frame))
