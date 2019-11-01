;
; this is a sample program, and this is drawing dragon-curve
;
; hidekuno@gmail.com
;
(define (dragon-curve-demo n)((dragon-curve n) frame))

(define (dragon-curve-geometric-demo n)
  ((transform-painter
    (dragon-curve n)
    (make-vect 0.0 0.0)
    (make-vect 0.75 0.25)
    (make-vect 0.25 0.75)) frame))
