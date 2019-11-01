;
; this is a sample program, and this is drawing tree curve
;
; hidekuno@gmail.com
;
;
(define (tree-demo n)((tree n) frame))

(define (tree-geometric-demo n)
  ((transform-painter
    (tree n)
    (make-vect 0.0 0.0)
    (make-vect 0.75 0.25)
    (make-vect 0.25 0.75)) frame))
