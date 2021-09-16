;
; this is a sample data from cui
;
; ex)
;   (load-file "/home/hideki/picture-language/cui-test-sicp.scm")
;   (time ((lambda () (demo)((square-limit fish 4) frame))))
;
; hidekuno@gmail.com
;
(define (draw-line s e) '())
(define (draw-image image origin edge1 edge2) '())
(define (screen-width) 720)
(define (screen-height) 720)
(define (image-width n) 180)
(define (image-height n) 180)
(define (gtk-major-version) 3)
(define (create-image-from-png image png) '())

(load-file (string-append
            (string-append (get-environment-variable "HOME") "/picture-language/")
            "sicp.scm"))
