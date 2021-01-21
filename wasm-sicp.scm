;
; this is a sample data from web assembly
;
; hidekuno@gmail.com
;
(load-image "rv" "https://coverartarchive.org/release-group/72d15666-99a7-321e-b1f3-a3f8c09dff9f/front-250.jpg")
(load-image "ps" "https://coverartarchive.org/release-group/fdd96703-7b21-365e-bdea-38029fbeb84e/front-250.jpg")
(load-image "sd" "https://coverartarchive.org/release-group/9b1acd78-3d19-37bb-8ca0-5816d44da439/front-250.jpg")
(load-image "am" "https://coverartarchive.org/release-group/e2f503d7-5488-3fe1-b3ac-f236d9f1b44c/front-250.jpg")
(load-url "sicp/abstract-data.scm"
          (begin
            (load-url "sicp/frame.scm"
                      (begin
                        (load-image "roger" "https://github.com/hidekuno/picture-language/blob/master/sicp/sicp.png?raw=true"
                                    (begin
                                      (define gframe (make-image-frame "roger" 3))
                                      (define roger (paint-image "roger"))))))
            (load-url "sicp/util.scm")
            (load-url "sicp/painter.scm"
                      (begin
                        (load-url "sicp/segments.scm"
                                  (begin
                                    (load-url "sicp/fractal.scm")
                                    (load-url "sicp/demo.scm")
                                    (load-url "sicp/segments-fish.scm")
                                    (define rv (paint-image "rv"))
                                    (define ps (paint-image "ps"))
                                    (define sd (paint-image "sd"))
                                    (define am (paint-image "am"))))))))
