;
; this is a demo program for picture language
;
; hidekuno@gmail.com
;
(define (demo)
  (let ((width  (lambda (n)(if (= 3 (gtk-major-version)) n (* n (screen-width)))))
        (height (lambda (n)(if (= 3 (gtk-major-version)) n (* n (screen-height))))))
    (let ((dframe (make-frame
                   (make-vect (width 0.5)(height 0.5))
                   (make-vect (width 0.5)(height 0))
                   (make-vect (width 0)(height 0.5))))
          (frame  (make-frame
                   (make-vect (width 0)(height 0.5))
                   (make-vect (width 0.5)(height 0))
                   (make-vect (width 0)(height 0.5))))
          (sframe (make-frame
                   (make-vect (width 0)(height 0))
                   (make-vect (width 0.5)(height 0))
                   (make-vect (width 0)(height 0.5))))
          (gframe (make-frame
                   (make-vect (width 0.5)(height 0))
                   (make-vect (width 0.5)(height 0))
                   (make-vect (width 0)(height 0.5)))))

      ((square-limit wave 4) sframe)
      (if (= 2 (gtk-major-version))
          ((square-limit mona 4) gframe)
          ((square-limit roger 4) gframe))
      ((square-limit (sierpinski 6) 0) frame)
      ((square-limit (tree 10) 0) dframe))))
