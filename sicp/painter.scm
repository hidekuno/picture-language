;
; this is a SICP program(https://sicp.iijlab.net/fulltext/x224.html)
; (https://sicp.iijlab.net/fulltext/x224.html)
;
; hidekuno@gmail.com
;
;;======================================================================
;; ペインタとフレームの変換法の情報をとり, 新しいペインタを作る
;;
;; ペインタは規定した平行四辺形の フレームの中に合うように,
;; ずらしたり大きさを変えたりした画像を描く
;;======================================================================
(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter
         (make-frame new-origin
                     (sub-vect (m corner1) new-origin)
                     (sub-vect (m corner2) new-origin)))))))
;;======================================================================
;; transform-painterの基本操作
;;======================================================================
(define (flip-vert painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

(define (rotate90 painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))

(define (rotate270 painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

(define (shrink-to-upper-right painter)
  (transform-painter painter
                     (make-vect 0.5 0.5)
                     (make-vect 1.0 0.5)
                     (make-vect 0.5 0.0)))

(define (squash-inwards painter)
  (transform-painter painter
                     (make-vect 0.0 0.0)
                     (make-vect 0.65 0.35)
                     (make-vect 0.35 0.65)))
;;======================================================================
;; 以下その応用
;;======================================================================
(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              split-point
                              (make-vect 0.0 1.0)))
          (paint-right
           (transform-painter painter2
                              split-point
                              (make-vect 1.0 0.0)
                              (make-vect 0.5 1.0))))
  (lambda (frame)
    (paint-left frame)
    (paint-right frame)))))

(define (below painter1 painter2)
  (rotate90 (beside (rotate270 painter1) (rotate270 painter2))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter(- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
        (let ((half (beside (flip-horiz quarter) quarter)))
          (below (flip-vert half) half))))

;;========================================================================
;; 線分を描画する
;;========================================================================
(define (draw-line-vect s e)
        (draw-line (xcor-vect s)(ycor-vect s)(xcor-vect e)(ycor-vect e)))

(define (segments->painter segment-list)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (for-each
       (lambda (segment)
         (draw-line-vect
          (m (start-segment segment))
          (m (end-segment segment)))) segment-list))))
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
;;========================================================================
;; イメージ用のフレームを作成する
;;========================================================================
(define (make-image-frame-rectangle img w-scale h-scale)
  (let ((coord (if (> 3 (gtk-major-version))
                   (cons (image-width img)(image-height img))
                   (cons (/ (image-width img)(screen-width))
                         (/ (image-height img)(screen-height))))))

      (make-frame (make-vect 0.0 0.0)
                  (make-vect (* w-scale (car coord)) 0.0)
                  (make-vect 0.0 (* h-scale (cdr coord))))))

(define (make-image-frame img scale)
  (make-image-frame-rectangle img scale scale))
