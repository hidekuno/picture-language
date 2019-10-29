;
; this is a fractal program for picture language
;
; hidekuno@gmail.com
;
;;========================================================================
;; 線を描画する
;;========================================================================
(define (draw-line-segment s f)
  (draw-line-vect
   ((frame-coord-map f) (start-segment s))
   ((frame-coord-map f) (end-segment s))))

;;========================================================================
;; コッホ曲線(paint版)
;; ((square-limit (koch 4) 0) frame)
;;========================================================================
(define (koch n)
  (lambda (frame)
    (define (koch-iter x0 y0 x1 y1 c)
      (let ((kcos (cs 60))
            (ksin (sn 60)))
        (if (> c 1)
            (let (
                  (xa (/ (+ (* x0 2) x1) 3))
                  (ya (/ (+ (* y0 2) y1) 3))
                  (xb (/ (+ (* x1 2) x0) 3))
                  (yb (/ (+ (* y1 2) y0) 3)))
              (let ((yc (+ ya (+ (* (- xb xa) ksin) (* (- yb ya) kcos))))
                    (xc (+ xa (- (* (- xb xa) kcos) (* (- yb ya) ksin)))))
                (koch-iter x0 y0 xa  ya (- c 1))
                (koch-iter xa ya xc  yc (- c 1))
                (koch-iter xc yc xb  yb (- c 1))
                (koch-iter xb yb x1  y1 (- c 1))))

            (draw-line-segment (make-segment (make-vect x0 y0) (make-vect x1 y1)) frame))))

    (koch-iter 0.3597222222222222 0.0 0.04722222222222222 0.6964285714285714 n)
    (koch-iter 0.04722222222222222 0.6964285714285714 0.6708333333333333 0.6964285714285714 n)
    (koch-iter 0.6708333333333333 0.6964285714285714 0.3597222222222222 0.0 n)))

;;========================================================================
;; ツリーカーブ(paint版)
;; ((square-limit (tree 14) 0) frame)
;;========================================================================
(define (tree n)
  (lambda (frame)
    (define (tree-iter x0 y0 x1 y1 c)
      (let ((tcos (cs 15))
            (tsin (sn 45))
            (alpha 0.6))
        (let ((xa (+ x1  (*    tcos (- x1 x0) alpha) (* -1 tsin (- y1 y0) alpha)))
              (ya (+ y1  (*    tsin (- x1 x0) alpha) (*    tcos (- y1 y0) alpha)))
              (xb (+ x1  (*    tcos (- x1 x0) alpha) (*    tsin (- y1 y0) alpha)))
              (yb (+ y1  (* -1 tsin (- x1 x0) alpha) (*    tcos (- y1 y0) alpha))))
          (draw-line-segment (make-segment (make-vect x0 y0) (make-vect x1 y1)) frame)
          (if (>= 0 c)
              (begin
                (draw-line-segment (make-segment (make-vect x1 y1) (make-vect xa ya)) frame)
                (draw-line-segment (make-segment (make-vect x1 y1) (make-vect xb yb)) frame))
              (begin
                (tree-iter x1 y1 xa ya (- c 1))
                (tree-iter x1 y1 xb yb (- c 1)))))))
    (tree-iter 0.4166666666666667 0.7142857142857143 0.4166666666666667 0.5357142857142857 n)))

;;========================================================================
;; sierpinski(paint版)
;;((square-limit (sierpinski 8) 0) frame)
;;========================================================================
(define (sierpinski n)
  (lambda (frame)
    (define (sierpinski-iter x0 y0 x1 y1 x2 y2 c)
      (if (> c 1) (let ((xx0 (/ (+ x0 x1) 2))
                        (yy0 (/ (+ y0 y1) 2))
                        (xx1 (/ (+ x1 x2) 2))
                        (yy1 (/ (+ y1 y2) 2))
                        (xx2 (/ (+ x2 x0) 2))
                        (yy2 (/ (+ y2 y0) 2)))
                     (sierpinski-iter x0 y0 xx0 yy0 xx2 yy2 (- c 1))
                     (sierpinski-iter x1 y1 xx0 yy0 xx1 yy1 (- c 1))
                     (sierpinski-iter x2 y2 xx2 yy2 xx1 yy1 (- c 1)))
          (begin
            (draw-line-segment (make-segment (make-vect x0 y0) (make-vect x1 y1)) frame)
            (draw-line-segment (make-segment (make-vect x1 y1) (make-vect x2 y2)) frame)
            (draw-line-segment (make-segment (make-vect x2 y2) (make-vect x0 y0)) frame))))
    (sierpinski-iter 
     0.44428969359331477 0.07168458781362007 
     0.04178272980501393 0.7706093189964157
     0.8481894150417827 0.7706093189964157 n)))

;;========================================================================
;; ドラゴン曲線(paint版)
;;((square-limit (dragon-curve 8) 0) frame)
;;========================================================================
(define (dragon-curve n)
  (lambda (frame)
    (define (dragon-curve-iter xa ya xb yb n)
      (let ((xx (- xb xa))
            (yy (* -1 (- yb ya))))
        (let ((xc (+ xa (/ (+ xx yy) 2)))
              (yc (+ yb (/ (+ xx yy) 2))))
          (if (>= 0 n)
              (begin
                (draw-line-segment (make-segment (make-vect xa ya) (make-vect xc yc)) frame)
                (draw-line-segment (make-segment (make-vect xb yb) (make-vect xc yc)) frame))
              (begin
                (dragon-curve-iter xa ya xc yc (- n 1))
                (dragon-curve-iter xb yb xc yc (- n 1)))))))
    (dragon-curve-iter 0.2777777777777778 0.25 0.5972222222222222 0.625 n)))

;;========================================================================
;; ヒルベルト曲線(paint版)
;; ((transform-painter (hilbert 6)(make-vect 0.15 0.0)(make-vect 0.9 0.0)(make-vect 0.15 0.75)) frame)
;;========================================================================
(define (hilbert c)
  (lambda (frame)
    (define width 1.0)
    (define lgth (expt (/ width 2.0) c))
    (define y (/ (- width (* lgth (expt 2 (- c 1)))) 3.6))
    (define x (- width y))
    (define oldx x)
    (define oldy y)

    (define (line)
      (begin
        (draw-line-segment (make-segment (make-vect oldx oldy) (make-vect x y)) frame)
        (set! oldx x)(set! oldy y)))

    (define (ldr c)
      (if (= 0 c)(list)
          (begin
            (dlu (- c 1))(set! x (- x lgth))(line)
            (ldr (- c 1))(set! y (+ y lgth))(line)
            (ldr (- c 1))(set! x (+ x lgth))(line)
            (urd (- c 1)))))

    (define (urd c)
      (if (= 0 c)(list)
          (begin
            (rul (- c 1))(set! y (- y lgth))(line)
            (urd (- c 1))(set! x (+ x lgth))(line)
            (urd (- c 1))(set! y (+ y lgth))(line)
            (ldr (- c 1)))))

    (define (rul c)
      (if (= 0 c)(list)
          (begin
            (urd (- c 1))(set! x (+ x lgth))(line)
            (rul (- c 1))(set! y (- y lgth))(line)
            (rul (- c 1))(set! x (- x lgth))(line)
            (dlu (- c 1)))))

    (define (dlu c)
      (if (= 0 c)(list)
          (begin
            (ldr (- c 1))(set! y (+ y lgth))(line)
            (dlu (- c 1))(set! x (- x lgth))(line)
            (dlu (- c 1))(set! y (- y lgth))(line)
            (rul (- c 1)))))
    (ldr c)))
