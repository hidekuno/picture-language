;
; This is a fractal program by ChatGPT
; (Write a program that draws a circular fractal diagram with scheme)
;
; https://chat.openai.com/chat
;
; ex. (circle-fractal 2 0.5 0.125 0.125)
;
(define (circle-fractal n radius x y)
  (if (= n 0)
      (draw-arc x y radius 0.0)
      (let ((new-radius (/ radius 2)))
        (circle-fractal (- n 1) new-radius x y)
        (circle-fractal (- n 1) new-radius (+ x radius) y)
        (circle-fractal (- n 1) new-radius (+ x radius) (+ y radius))
        (circle-fractal (- n 1) new-radius x (+ y radius)))))
