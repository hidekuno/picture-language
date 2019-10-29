;
; this is a sample program, and this is drawing hilbert-curve
;
; hidekuno@gmail.com
;
(define (hilbert-demo n frame)
  ((transform-painter
    (hilbert n)
    (make-vect 0.15 0.0)
    (make-vect 0.9 0.0)
    (make-vect 0.15 0.75)) frame))
