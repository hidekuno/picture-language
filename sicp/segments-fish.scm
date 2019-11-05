;
; this is a demo program for picture language
;
; hidekuno@gmail.com
;
; from:  http://www.frank-buss.de/lisp/functional.html
; How To Convert
;;
;(define (grid n)(list (/ (car n) 16.0)(/ (cadr n) 16.0)))
;(define (convert n)  (list (grid (car n))(grid (cadr n))))
;(for-each (lambda (l) (display l)(newline)) (map (lambda (n) (convert n)) a))
;;
;; Here is convert data
;;
(define fish1
  (let ((segments
         (list
          (make-segment (make-vect 0.25 0.25)(make-vect 0.375 0.0))
          (make-segment (make-vect 0.0 0.1875)(make-vect 0.1875 0.25))
          (make-segment (make-vect 0.1875 0.25)(make-vect 0.0 0.5))
          (make-segment (make-vect 0.0 0.5)(make-vect 0.0 0.1875))
          (make-segment (make-vect 0.25 0.3125)(make-vect 0.4375 0.375))
          (make-segment (make-vect 0.4375 0.375)(make-vect 0.25 0.625))
          (make-segment (make-vect 0.25 0.625)(make-vect 0.25 0.3125))
          (make-segment (make-vect 0.6875 0.0)(make-vect 0.625 0.25))
          (make-segment (make-vect 0.625 0.25)(make-vect 0.5 0.5))
          (make-segment (make-vect 0.5 0.5)(make-vect 0.25 0.8125))
          (make-segment (make-vect 0.25 0.8125)(make-vect 0.0 1.0))
          (make-segment (make-vect 0.6875 0.0)(make-vect 0.875 0.125))
          (make-segment (make-vect 0.875 0.125)(make-vect 1.0 0.125))
          (make-segment (make-vect 0.625 0.25)(make-vect 0.8125 0.3125))
          (make-segment (make-vect 0.8125 0.3125)(make-vect 1.0 0.25))
          (make-segment (make-vect 0.5625 0.375)(make-vect 0.75 0.4375))
          (make-segment (make-vect 0.75 0.4375)(make-vect 1.0 0.375))
          (make-segment (make-vect 0.5 0.5)(make-vect 0.75 0.5625))
          (make-segment (make-vect 0.75 0.5625)(make-vect 1.0 0.5))
          (make-segment (make-vect 0.5 0.75)(make-vect 1.0 0.625))
          (make-segment (make-vect 0.0 1.0)(make-vect 0.375 0.9375))
          (make-segment (make-vect 0.375 0.9375)(make-vect 0.5 1.0))
          (make-segment (make-vect 0.5 1.0)(make-vect 0.75 0.75))
          (make-segment (make-vect 0.75 0.75)(make-vect 1.0 0.75))
          (make-segment (make-vect 0.625 1.0)(make-vect 0.75 0.875))
          (make-segment (make-vect 0.75 0.875)(make-vect 1.0 0.8125))
          (make-segment (make-vect 0.75 1.0)(make-vect 0.8125 0.9375))
          (make-segment (make-vect 0.8125 0.9375)(make-vect 1.0 0.875))
          (make-segment (make-vect 0.875 1.0)(make-vect 1.0 0.9375)))))
    (segments->painter segments)))

(define fish2
  (let ((segments
         (list
          (make-segment (make-vect 0.125 0.0) (make-vect 0.25 0.3125))
          (make-segment (make-vect 0.25 0.3125) (make-vect 0.25 0.4375))
          (make-segment (make-vect 0.25 0.0) (make-vect 0.375 0.3125))
          (make-segment (make-vect 0.375 0.3125) (make-vect 0.375 0.4375))
          (make-segment (make-vect 0.375 0.0) (make-vect 0.5 0.3125))
          (make-segment (make-vect 0.5 0.3125) (make-vect 0.5 0.5))
          (make-segment (make-vect 0.5 0.0) (make-vect 0.625 0.375))
          (make-segment (make-vect 0.625 0.375) (make-vect 0.625 0.5625))
          (make-segment (make-vect 0.625 0.0) (make-vect 0.875 0.6875))
          (make-segment (make-vect 0.75 0.0) (make-vect 0.8125 0.25))
          (make-segment (make-vect 0.8125 0.25) (make-vect 1.0 0.5))
          (make-segment (make-vect 1.0 0.5) (make-vect 0.9375 0.625))
          (make-segment (make-vect 0.9375 0.625) (make-vect 1.0 1.0))
          (make-segment (make-vect 1.0 1.0) (make-vect 0.75 0.625))
          (make-segment (make-vect 0.75 0.625) (make-vect 0.375 0.4375))
          (make-segment (make-vect 0.375 0.4375) (make-vect 0.25 0.4375))
          (make-segment (make-vect 0.25 0.4375) (make-vect 0.0 0.5))
          (make-segment (make-vect 0.8125 0.0) (make-vect 1.0 0.375))
          (make-segment (make-vect 0.875 0.0) (make-vect 1.0 0.25))
          (make-segment (make-vect 0.9375 0.0) (make-vect 1.0 0.125))
          (make-segment (make-vect 0.0 0.625) (make-vect 0.4375 0.6875))
          (make-segment (make-vect 0.5625 0.75) (make-vect 0.625 0.625))
          (make-segment (make-vect 0.625 0.625) (make-vect 0.75 0.75))
          (make-segment (make-vect 0.75 0.75) (make-vect 0.5625 0.75))
          (make-segment (make-vect 0.5 0.9375) (make-vect 0.5625 0.8125))
          (make-segment (make-vect 0.5625 0.8125) (make-vect 0.6875 0.9375))
          (make-segment (make-vect 0.6875 0.9375) (make-vect 0.5 0.9375))
          (make-segment (make-vect 0.0 0.75) (make-vect 0.1875 0.8125))
          (make-segment (make-vect 0.1875 0.8125) (make-vect 0.4375 0.9375))
          (make-segment (make-vect 0.4375 0.9375) (make-vect 0.5 1.0))
          (make-segment (make-vect 0.125 1.0) (make-vect 0.1875 0.8125))
          (make-segment (make-vect 0.25 1.0) (make-vect 0.3125 0.875))
          (make-segment (make-vect 0.375 1.0) (make-vect 0.4375 0.9375)))))
    (segments->painter segments)))

(define fish3
  (let ((segments
         (list
          (make-segment (make-vect 0.0 0.75) (make-vect 0.0625 0.875))
          (make-segment (make-vect 0.0 0.5) (make-vect 0.125 0.75))
          (make-segment (make-vect 0.0 0.25) (make-vect 0.3125 0.625))
          (make-segment (make-vect 0.0 0.0) (make-vect 0.5 0.5))
          (make-segment (make-vect 0.0625 0.0625) (make-vect 0.25 0.0))
          (make-segment (make-vect 0.125 0.125) (make-vect 0.5 0.0))
          (make-segment (make-vect 0.1875 0.1875) (make-vect 0.5 0.125))
          (make-segment (make-vect 0.5 0.125) (make-vect 0.75 0.0))
          (make-segment (make-vect 0.3125 0.3125) (make-vect 0.75 0.1875))
          (make-segment (make-vect 0.75 0.1875) (make-vect 1.0 0.0))
          (make-segment (make-vect 0.0 1.0) (make-vect 0.125 0.75))
          (make-segment (make-vect 0.125 0.75) (make-vect 0.5 0.5))
          (make-segment (make-vect 0.5 0.5) (make-vect 0.875 0.375))
          (make-segment (make-vect 0.875 0.375) (make-vect 1.0 0.25))
          (make-segment (make-vect 0.375 1.0) (make-vect 0.6875 0.625))
          (make-segment (make-vect 0.6875 0.625) (make-vect 1.0 0.375))
          (make-segment (make-vect 0.6875 1.0) (make-vect 0.75 0.75))
          (make-segment (make-vect 0.75 0.75) (make-vect 1.0 0.5))
          (make-segment (make-vect 0.75 0.75) (make-vect 1.0 1.0))
          (make-segment (make-vect 0.8125 0.8125) (make-vect 1.0 0.625))
          (make-segment (make-vect 0.875 0.875) (make-vect 1.0 0.75))
          (make-segment (make-vect 0.9375 0.9375) (make-vect 1.0 0.875)))))
    (segments->painter segments)))

(define fish4
  (let ((segments
         (list
          (make-segment (make-vect 0.0 0.0) (make-vect 0.25 0.125))
          (make-segment (make-vect 0.25 0.125) (make-vect 0.5 0.125))
          (make-segment (make-vect 0.5 0.125) (make-vect 1.0 0.0))
          (make-segment (make-vect 0.0 0.25) (make-vect 0.125 0.0625))
          (make-segment (make-vect 0.0 0.375) (make-vect 0.4375 0.25))
          (make-segment (make-vect 0.0 0.5) (make-vect 0.5 0.375))
          (make-segment (make-vect 0.0 0.625) (make-vect 0.4375 0.5))
          (make-segment (make-vect 0.0 0.75) (make-vect 0.4375 0.625))
          (make-segment (make-vect 0.0 0.875) (make-vect 0.4375 0.8125))
          (make-segment (make-vect 0.5 1.0) (make-vect 0.4375 0.8125))
          (make-segment (make-vect 0.4375 0.8125) (make-vect 0.4375 0.5))
          (make-segment (make-vect 0.4375 0.5) (make-vect 0.5 0.375))
          (make-segment (make-vect 0.5 0.375) (make-vect 0.625 0.25))
          (make-segment (make-vect 0.625 0.25) (make-vect 1.0 0.0))
          (make-segment (make-vect 0.625 1.0) (make-vect 0.6875 0.625))
          (make-segment (make-vect 0.625 0.375) (make-vect 0.75 0.25))
          (make-segment (make-vect 0.75 0.25) (make-vect 0.75 0.4375))
          (make-segment (make-vect 0.75 0.4375) (make-vect 0.625 0.375))
          (make-segment (make-vect 0.8125 0.4375) (make-vect 0.9375 0.3125))
          (make-segment (make-vect 0.9375 0.3125) (make-vect 0.9375 0.5))
          (make-segment (make-vect 0.9375 0.5) (make-vect 0.8125 0.4375))
          (make-segment (make-vect 0.75 1.0) (make-vect 0.8125 0.8125))
          (make-segment (make-vect 0.8125 0.8125) (make-vect 0.9375 0.5625))
          (make-segment (make-vect 0.9375 0.5625) (make-vect 1.0 0.5))
          (make-segment (make-vect 0.8125 0.8125) (make-vect 1.0 0.875))
          (make-segment (make-vect 0.875 0.6875) (make-vect 1.0 0.75))
          (make-segment (make-vect 0.9375 0.5625) (make-vect 1.0 0.625)))))
    (segments->painter segments)))

;; ex.
;;((square-limit
;;  (below (beside (flip-vert fish1)(flip-vert fish2))
;;         (beside (flip-vert fish3)(flip-vert fish4))) 4) frame)

;; ex.
;;
;; (beside (below (rotate270 (flip-vert fish2)) (flip-horiz fish2))(below (flip-vert fish2)(rotate90 (flip-vert fish2))))
