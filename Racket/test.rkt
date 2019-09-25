#lang racket

(define (row-sum lst)
  (apply + lst)
)
(define (sum-mat mat)
  (if (null? mat)
  0
  (apply + (map row-sum mat))
  )
)

(sum-mat '((1 2 3) (4 5 6) (7 8 9)))