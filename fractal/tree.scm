;
; this is a sample program, and this is drawing tree curve
;
; hidekuno@gmail.com
;
(define (tree-demo n frame)
  ((transform-painter
    (tree n)
    (make-vect 0.0 0.0)
    (make-vect 1.0 0.0)
    (make-vect 0.0 1.0)) frame))
