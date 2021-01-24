;
; this is a sample program, and this is drawing tree curve
;
; hidekuno@gmail.com
;
;
(define (tree-demo)(draw-tree 14))

(define (tree-sicp-demo)
  ((transform-painter
    (tree 14)
    (make-vect 0.0 0.0)
    (make-vect 0.75 0.25)
    (make-vect 0.25 0.75)) frame))
