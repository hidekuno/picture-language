;
; this is a SICP program
; (https://sicp.iijlab.net/fulltext/x224.html)
;
; hidekuno@gmail.com
;

;;========================================================================
;; フレームの構築子
;;========================================================================
(define (make-frame origin edge1 edge2)  (list origin edge1 edge2))
(define (origin-frame frame)  (car frame))
(define (edge1-frame frame) (car (cdr frame)))
(define (edge2-frame frame)  (car (cdr (cdr frame))))

;;========================================================================
;; フレーム内へベクタを写像(coordinate 座標)
;;========================================================================
(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

;;========================================================================
;; ベクトルの構築子
;;========================================================================
(define (make-vect x y) (cons x y))
(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))

;;========================================================================
;; ベクトルの演算子
;;========================================================================
(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))
