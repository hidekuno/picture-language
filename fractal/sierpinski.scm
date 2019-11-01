;
; this is a sample program, and this is drawing sierpinski
;
; hidekuno@gmail.com
;
(define (sierpinski-demo n)((sierpinski n) frame))

(define (sierpinski-geometric-demo n)
  ((transform-painter
    (sierpinski n)
    (make-vect 0.0 0.0)
    (make-vect 0.75 0.25)
    (make-vect 0.25 0.75)) frame))
