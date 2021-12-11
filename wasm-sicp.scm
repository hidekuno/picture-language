;
; this is a sample data from web assembly
;
; hidekuno@gmail.com
;
(load-image "roger" "https://github.com/hidekuno/picture-language/blob/master/sicp/sicp.png?raw=true")
(load-image "rv" "https://m.media-amazon.com/images/I/617oXibcXRL._AC_UL320_.jpg")
(load-image "ps" "https://m.media-amazon.com/images/I/51D4ZYSXJ6L._AC_UL320_.jpg")
(load-image "sd" "https://m.media-amazon.com/images/I/51M-Dh4hDTL._AC_UL320_.jpg")
(load-image "am" "https://m.media-amazon.com/images/I/81bl1CsAm7L._AC_UL320_.jpg")

(load-url "sicp/abstract-data.scm"
          (begin
            (load-url "sicp/frame.scm"
                      (begin (define gframe (make-image-frame "roger" 3))))
            (load-url "sicp/painter.scm"
                      (begin
                        (define rv (paint-image "rv"))
                        (define ps (paint-image "ps"))
                        (define sd (paint-image "sd"))
                        (define am (paint-image "am"))
                        (define roger (paint-image "roger"))))
            (load-url "sicp/segments.scm"
                      (begin (load-url "sicp/segments-fish.scm")))
            (load-url "sicp/fractal.scm")
            (load-url "sicp/demo.scm")))
