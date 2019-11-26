;
; this is a SICP program
; (https://sicp.iijlab.net/fulltext/x224.html)
;
; hidekuno@gmail.com
;
(create-image-from-png
 "roger"
 (string-append (get-environment-variable "HOME") "/picture-language/sicp/sicp.png"))
(define gframe (make-image-frame "roger" 3))
(define roger (paint-image "roger"))
;;((square-limit roger 4) gframe)
