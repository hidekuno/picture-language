;
; this is a sample program, and this is drawing fractal circle
;
; ex. (seg-circle 24)
;     (seg-circle 30)
;
(define canvas-size (if (= 3 (gtk-major-version)) 1.0 (screen-width)))
(define pi (* (atan 1) 4))

(define (seg-circle times)

  (define (calc-seg x y n)
    (let ((t (* (/ pi 180) (* n (/ 360 times)))))
      (cons (* (cos t) x)(* (sin t) y))))

  (define (seg-circle-iter n)
    (let ((x (/ canvas-size 2))
          (y (/ canvas-size 2)))
      (cond ((>= 0 n) 'nil)
            (else
             (let loop ((i (/ times 2)))
               (cond ((>= 0 i) 'nil)
                     (else
                      (let ((s (calc-seg x y n))
                            (e (calc-seg x y (modulo (+ n (* i 2)) times))))
                        (draw-line (cons (+ (car s) x) (+ (cdr s) y))
                                   (cons (+ (car e) x) (+ (cdr e) y))))
                      (loop (- i 1)))))
             (seg-circle-iter (- n 1))))))
  (seg-circle-iter times))
