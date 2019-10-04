;
; this is a sample program, and this is drawing dragon-curve
;
; hidekuno@gmail.com
;
(define (dragon-curve xa ya xb yb n)
  (let ((xx (- xb xa))
        (yy (* -1 (- yb ya))))
    (let ((xc (+ xa (/ (+ xx yy) 2)))
          (yc (+ yb (/ (+ xx yy) 2))))
      (if (>= 0 n)
          (begin
            (draw-line xa ya xc yc)
            (draw-line xb yb xc yc))
          (begin
            (dragon-curve xa ya xc yc (- n 1))
            (dragon-curve xb yb xc yc (- n 1)))))))
