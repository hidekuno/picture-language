;
; this is a sample program, and this is drawing sierpinski
;
; hidekuno@gmail.com
;
(define (sierpinski-demo n frame)
  ((transform-painter
    (sierpinski n)
    (make-vect 0.0 0.0)
    (make-vect 1.0 0.0)
    (make-vect 0.0 1.0)) frame))
