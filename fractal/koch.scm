;
; this is a sample program, and this is drawing koch
;
; hidekuno@gmail.com
;
(define (koch-demo n frame)
  ((transform-painter
    (koch n)
    (make-vect 0.0 0.0)
    (make-vect 1.0 0.0)
    (make-vect 0.0 1.0)) frame))
