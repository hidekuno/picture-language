;
; this is a SICP program(https://sicp.iijlab.net/fulltext/x224.html)
; (https://sicp.iijlab.net/fulltext/x224.html)
;
; hidekuno@gmail.com
;
;;========================================================================
;; 線分を描画する
;;========================================================================
(define (draw-line-vect s e)
        (draw-line (xcor-vect s)(ycor-vect s)(xcor-vect e)(ycor-vect e)))

;;========================================================================
;; イメージを描画する
;;========================================================================
(define (paint-image image-name)
    (lambda (f)
      (draw-image image-name
                  (xcor-vect (origin-frame f))
                  (ycor-vect (origin-frame f))
                  (xcor-vect (edge1-frame f))
                  (ycor-vect (edge1-frame f))
                  (xcor-vect (edge2-frame f))
                  (ycor-vect (edge2-frame f)))))
