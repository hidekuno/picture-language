;
; this is a sample program, and this is drawing sierpinski
;
; hidekuno@gmail.com
;
(define (sierpinski-demo)(draw-sierpinski 8))

(define (sierpinski-sicp-demo)
  ((transform-painter
    (sierpinski 8)
    (make-vect 0.0 0.0)
    (make-vect 0.75 0.25)
    (make-vect 0.25 0.75)) frame))
