;
; this is a sample program, and this is drawing circle
;
; hidekuno@gmail.com
;
; ex.
; (circle-sketch 5)
;

(define canvas-size (if (= 3 (gtk-major-version)) 1.0 (screen-width)))
(define center (cons (/ canvas-size 2)(/ canvas-size 2)))
(define r (/ canvas-size 3.35))
(define l (/ canvas-size 5))
(define pi (* 4 (atan 1)))

(define (circle-sketch step)
  (let loop ((angle 360))
    (cond ((>= 0 angle) 'nil)
          (else
           (let ((rad (/ (* 2 pi angle) 360)))
             (let ((x (+ (* (cos rad) r)(car center)))
                   (y (+ (* (sin rad) r)(cdr center))))
               (draw-arc x y l 0.0)))
           (loop (- angle step))))))
