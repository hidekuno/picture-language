;
; this is a sample program, and this is drawing circle
;
; hidekuno@gmail.com
;
; ex.
; (circle-recursion 0.5 0.5 0.25 5)
;
(define (circle-recursion x y r n)
  (draw-arc x y (* r 2) 0.0)
  (cond ((> n 1)
         (let ((nr (/ r 2)))
           (circle-recursion (+ x r) y nr (- n 1))
           (circle-recursion (- x r) y nr (- n 1))))
        (else '())))
