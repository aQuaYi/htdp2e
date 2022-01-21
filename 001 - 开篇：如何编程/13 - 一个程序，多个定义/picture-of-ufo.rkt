;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname picture-of-ufo) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; 常量
(define WIDTH 200)
(define HEIGHT 400)
(define ROCK-HEIGHT 10)

(define ROCK (rectangle WIDTH ROCK-HEIGHT "solid" "brown"))
(define ROCK-CENTER-TO-TOP
  (- HEIGHT (/ (image-height ROCK) 2)))
(define MIDDLE-OF-MTSCN (/ WIDTH 2))
(define MTSCN (place-image
      ROCK
      MIDDLE-OF-MTSCN
      ROCK-CENTER-TO-TOP
      (rectangle WIDTH HEIGHT "solid" "blue")))


(define UFO (overlay (circle 10 "solid" "green")
                     (rectangle 40 4 "solid" "green")))
(define UFO-CENTER-TO-TOP
  (- HEIGHT (/ (image-height UFO) 2) ROCK-HEIGHT))  

(define (picture-of-ufo h)
  (cond
    [(<= h UFO-CENTER-TO-TOP)
     (place-image
      UFO
      MIDDLE-OF-MTSCN
      h
      MTSCN)]
    [(> h UFO-CENTER-TO-TOP)
     (place-image
      UFO
      MIDDLE-OF-MTSCN
      UFO-CENTER-TO-TOP
      MTSCN)]))

(animate picture-of-ufo)