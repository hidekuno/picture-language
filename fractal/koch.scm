;
; this is a sample program, and this is drawing koch
;
; hidekuno@gmail.com
;
(define (koch-demo n)((koch n) frame))

(define (koch-geometric-demo n)
  ((transform-painter
    (koch n)
    (make-vect 0.0 0.0)
    (make-vect 0.75 0.25)
    (make-vect 0.25 0.75)) frame))
