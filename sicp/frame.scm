;
; this is a SICP program
; (https://sicp.iijlab.net/fulltext/x224.html)
;
;
; hidekuno@gmail.com
;
;;========================================================================
;; ベクトル用のフレームを作成する
;;========================================================================
(define frame
  (if (> 3 (gtk-major-version))
      (make-frame (make-vect 0 0) (make-vect (screen-width) 0) (make-vect 0 (screen-height)))
      (make-frame (make-vect 0 0) (make-vect 1 0) (make-vect 0 1))))

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
