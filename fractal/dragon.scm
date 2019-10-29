;
; this is a sample program, and this is drawing dragon-curve
;
; hidekuno@gmail.com
;
(define (dragon-curve-demo n frame)
  ((transform-painter
    (dragon-curve n)
    (make-vect 0.0 0.0)
    (make-vect 1.0 0.0)
    (make-vect 0.0 1.0)) frame))
