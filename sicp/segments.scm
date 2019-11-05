;
; this is a SICP program
; (https://sicp.iijlab.net/fulltext/x224.html)
;
;
; hidekuno@gmail.com
;
(define frame
  (if (= 2 (gtk-major-version))
      (make-frame (make-vect 0 0) (make-vect (screen-width) 0) (make-vect 0 (screen-height)))
      (make-frame (make-vect 0 0) (make-vect 1 0) (make-vect 0 1))))

(define outline
  (let ((v0 (make-vect 0.0 0.0))
        (v1 (make-vect 1.0 0.0))
        (v2 (make-vect 0.0 1.0))
        (v3 (make-vect 1.0 1.0)))
    (segments->painter (list (make-segment v0 v1)
                             (make-segment v1 v3)
                             (make-segment v3 v2)
                             (make-segment v2 v0)))))
;;((square-limit outline 4) frame)

(define x11
  (let ((v1 (make-vect 0.0 0.0))
        (v2 (make-vect 1.0 0.0))
        (v3 (make-vect 0.0 1.0))
        (v4 (make-vect 1.0 1.0)))
    (segments->painter (list (make-segment v1 v4)
                             (make-segment v2 v3)))))
;;((square-limit x11 4) frame)

(define diamond
  (let ((v1 (make-vect 0.5 0.0))
        (v2 (make-vect 0.0 0.5))
        (v3 (make-vect 1.0 0.5))
        (v4 (make-vect 0.5 1.0)))
    (segments->painter (list (make-segment v1 v3)
                             (make-segment v3 v4)
                             (make-segment v4 v2)
                             (make-segment v2 v1)))))
;;((square-limit diamond 4) frame)

(define wave
  (let ((segments (list
                   (make-segment(make-vect 0.35 0.15) (make-vect 0.4 0))
                   (make-segment(make-vect 0.65 0.15) (make-vect 0.6 0))
                   (make-segment(make-vect 0.35 0.15) (make-vect 0.4 0.35))
                   (make-segment(make-vect 0.65 0.15) (make-vect 0.6 0.35))
                   (make-segment(make-vect 0.6 0.35)  (make-vect 0.75 0.35))
                   (make-segment(make-vect 0.4 0.35)  (make-vect 0.3 0.35))
                   (make-segment(make-vect 0.75 0.35) (make-vect 1 0.65))
                   (make-segment(make-vect 0.6 0.55)  (make-vect 1 0.85))
                   (make-segment(make-vect 0.6 0.55)  (make-vect 0.75 1))
                   (make-segment(make-vect 0.5 0.7)   (make-vect 0.6 1))
                   (make-segment(make-vect 0.3 0.35)  (make-vect 0.15 0.4))
                   (make-segment(make-vect 0.3 0.4)   (make-vect 0.15 0.6))
                   (make-segment(make-vect 0.15 0.4)  (make-vect 0 0.15))
                   (make-segment(make-vect 0.15 0.6)  (make-vect 0 0.35))
                   (make-segment(make-vect 0.3 0.4)   (make-vect 0.35 0.5))
                   (make-segment(make-vect 0.35 0.5)  (make-vect 0.25 1))
                   (make-segment(make-vect 0.5 0.7)   (make-vect 0.4 1)))))
    (segments->painter segments)))
;;((square-limit wave 4) frame)

;; wave2 is written jots-jottings
;; It's from (http://jots-jottings.blogspot.com/2011/10/sicp-exercise-252-abusing-painters.html)
;; add nose
(define wave2
  (let ((segments (list
                   (make-segment(make-vect 0.0  0.85)(make-vect 0.15 0.6))
                   (make-segment(make-vect 0.15 0.6)(make-vect 0.3  0.65))
                   (make-segment(make-vect 0.3  0.65)(make-vect 0.4  0.65))
                   (make-segment(make-vect 0.4  0.65)(make-vect 0.35 0.85))
                   (make-segment(make-vect 0.35 0.85)(make-vect 0.4  1.0))
                   (make-segment(make-vect 0.6  1.0)(make-vect 0.65 0.85))
                   (make-segment(make-vect 0.65 0.85)(make-vect 0.6  0.65))
                   (make-segment(make-vect 0.6  0.65)(make-vect 0.75 0.65))
                   (make-segment(make-vect 0.75 0.65)(make-vect 1.0  0.35))
                   (make-segment(make-vect 1.0  0.15)(make-vect 0.6  0.45))
                   (make-segment(make-vect 0.6  0.45)(make-vect 0.75 0.0))
                   (make-segment(make-vect 0.6  0.0)(make-vect 0.5  0.3))
                   (make-segment(make-vect 0.5  0.3)(make-vect 0.4  0.0))
                   (make-segment(make-vect 0.25 0.0)(make-vect 0.35 0.5))
                   (make-segment(make-vect 0.35 0.5)(make-vect 0.3  0.6))
                   (make-segment(make-vect 0.3  0.6)(make-vect 0.15 0.4))
                   (make-segment(make-vect 0.15 0.4)(make-vect 0.0  0.65))
                   (make-segment(make-vect 0.4 0.9)(make-vect 0.45 0.9))
                   (make-segment(make-vect 0.45 0.9)(make-vect 0.45 0.85))
                   (make-segment(make-vect 0.45 0.85)(make-vect 0.4 0.85))
                   (make-segment(make-vect 0.4 0.85)(make-vect 0.4 0.9))
                   (make-segment(make-vect 0.55 0.9)(make-vect 0.6 0.9))
                   (make-segment(make-vect 0.6 0.9)(make-vect 0.6 0.85))
                   (make-segment(make-vect 0.6 0.85)(make-vect 0.55 0.85))
                   (make-segment(make-vect 0.55 0.85)(make-vect 0.55 0.9))
                   (make-segment(make-vect 0.4 0.75)(make-vect 0.45 0.7))
                   (make-segment(make-vect 0.45 0.7)(make-vect 0.55 0.7))
                   (make-segment(make-vect 0.55 0.7)(make-vect 0.6 0.75))
                   (make-segment(make-vect 0.5 0.82)(make-vect  0.5 0.77)))))
    (segments->painter segments)))
;;((square-limit wave2 4) frame)

;; mona is written by higepon(Author of MonaOS)
;; It's from (http://higepon.hatenablog.com/entry/20060426/1145547441)
(define mona
  (let ((segments (list
                   (make-segment (make-vect 0.2 0.7) (make-vect 0.3 0.9))
                   (make-segment (make-vect 0.4 0.7) (make-vect 0.3 0.9))
                   (make-segment (make-vect 0.6 0.7) (make-vect 0.7 0.9))
                   (make-segment (make-vect 0.8 0.7) (make-vect 0.7 0.9))
                   (make-segment (make-vect 0.3 0.5) (make-vect 0.4 0.6))
                   (make-segment (make-vect 0.6 0.6) (make-vect 0.7 0.5))
                   (make-segment (make-vect 0.5 0.2) (make-vect 0.6 0.4))
                   (make-segment (make-vect 0.5 0.2) (make-vect 0.4 0.4))
                   (make-segment (make-vect 0.45 0.3) (make-vect 0.55 0.3))
                   (make-segment (make-vect 0.85 0.6) (make-vect 0.9 0.4))
                   (make-segment (make-vect 0.85 0.2) (make-vect 0.9 0.4)))))
    (segments->painter segments)))
;;((square-limit mona 4) frame)

;; from http://www.frank-buss.de/lisp/functional.html
;; How To Convert
;;
;;(let loop ((l a)(r '())(f '()))
;;  (if (null? l) (cdr (cdr (reverse r)))
;;      (loop
;;       (cdr l)
;;       (append (list (car l)) (list f) r)
;;       (car l))))
;;
;; here is convert data
(define man
  (let ((segments
         (list
          (make-segment (make-vect 0.42857142857142855 0.5)(make-vect 0.0 0.5))
          (make-segment (make-vect 0.0 0.5)(make-vect 0.0 0.6))
          (make-segment (make-vect 0.0 0.6)(make-vect 0.42857142857142855 0.6))
          (make-segment (make-vect 0.42857142857142855 0.6)(make-vect 0.42857142857142855 0.7))
          (make-segment (make-vect 0.42857142857142855 0.7)(make-vect 0.2857142857142857 0.8))
          (make-segment (make-vect 0.2857142857142857 0.8)(make-vect 0.2857142857142857 0.9))
          (make-segment (make-vect 0.2857142857142857 0.9)(make-vect 0.42857142857142855 1.0))
          (make-segment (make-vect 0.42857142857142855 1.0)(make-vect 0.5714285714285714 1.0))
          (make-segment (make-vect 0.5714285714285714 1.0)(make-vect 0.7142857142857143 0.9))
          (make-segment (make-vect 0.7142857142857143 0.9)(make-vect 0.7142857142857143 0.8))
          (make-segment (make-vect 0.7142857142857143 0.8)(make-vect 0.5714285714285714 0.7))
          (make-segment (make-vect 0.5714285714285714 0.7)(make-vect 0.5714285714285714 0.6))
          (make-segment (make-vect 0.5714285714285714 0.6)(make-vect 0.7142857142857143 0.6))
          (make-segment (make-vect 0.7142857142857143 0.6)(make-vect 0.7142857142857143 0.7))
          (make-segment (make-vect 0.7142857142857143 0.7)(make-vect 0.8571428571428571 0.7))
          (make-segment (make-vect 0.8571428571428571 0.7)(make-vect 0.8571428571428571 0.5))
          (make-segment (make-vect 0.8571428571428571 0.5)(make-vect 0.5714285714285714 0.5))
          (make-segment (make-vect 0.5714285714285714 0.5)(make-vect 0.5714285714285714 0.4))
          (make-segment (make-vect 0.5714285714285714 0.4)(make-vect 0.7142857142857143 0.0))
          (make-segment (make-vect 0.7142857142857143 0.0)(make-vect 0.5714285714285714 0.0))
          (make-segment (make-vect 0.5714285714285714 0.0)(make-vect 0.5 0.2))
          (make-segment (make-vect 0.5 0.2)(make-vect 0.42857142857142855 0.0))
          (make-segment (make-vect 0.42857142857142855 0.0)(make-vect 0.2857142857142857 0.0))
          (make-segment (make-vect 0.2857142857142857 0.0)(make-vect 0.42857142857142855 0.4))
          (make-segment (make-vect 0.42857142857142855 0.4)(make-vect 0.42857142857142855 0.5)))))
    (segments->painter segments)))
