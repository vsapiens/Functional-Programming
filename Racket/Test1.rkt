#lang racket

(define (removeRep lst)
  (if (null? lst)
  null
  (if (member (car lst) (cdr lst))
    (removeRep (cdr lst))
    (cons (car lst) (removeRep (cdr lst)))
  )
  )
)
;(removeRep '(1 2 3 4 3 5 2 6 6 7 1 10))
;(removeRep '(a a b b b c d a c f f g h))

(define (row-trans lst col)
  (if (null? lst)
    null
    (if (> col 0)
      (cons (car lst) (row-trans (cdr lst) (- col 1)))
      null
    )
  )
)

(define (advance lst index)
  (if (null? lst)
    null
    (if (> index 0)
      (advance (cdr lst) (- index 1))
      (cons (car lst) (advance (cdr lst) (- index 1)))
    )
  )
)

(define (list2matrix lst row col)
  (cond
  ((null? lst) null)
  ( (< (length lst) (* row col)) lst)
  ((cons (row-trans lst col) (list2matrix (advance lst col) (- row 1) col)))
  (else null)
  )
)

;(list2matrix '(10 20 30 40 50 60) 2 3)
;(list2matrix '(10 20 30 40 50 60 70 80 90 100) 5 3)

(define (mult x y)
  (if(null? y)
    null
    (cons (cons x (list (car y))) (mult x (cdr y)))
  )
)

(define (product lst1 lst2)
  (if (null? lst1)
    null
  (append (mult (car lst1) lst2) (product (cdr lst1) lst2))
  )
)
;(product '(1 2 3) '(4 5 6) )


(define (enigmaC x)
(apply - (apply * 1 4 (append (map * x x) '(2 3)) ) '(100) )
)
;(enigmaC '(2 3))

;(list-tail '(1 2 3 4 5 6 7 8 9) 3)

(define (enigmaB x y) (let ((a y))
(let ((b x)) (list
(* a (+ b 1))
(if (> a b) (list b) b) )
) )
)
(enigmaB 5 10)