#lang racket

(define (quickSort lst)
  (if (null? lst)
    null
    (append
      (quickSort (filter (lambda (x) (<= x (car lst))) (cdr lst)))
      (list (car lst))
      (quickSort (filter (lambda (x) (> x (car lst))) (cdr lst)))
    )
  )
)

(define (matrMul mat1 mat2)
  (map
   (lambda (mult-row) 
    (apply map (lambda (mult-column) (apply + (map * mult-row mult-column)) mat2)) mat1)
  )
)

;(matrMul '((1 2 3) (4 5 6) (7 8 9)) '((1 2 3) (4 5 6) (7 8 9)))

(define (tableSum lst)
  (let 
    (
      (m (filter (lambda (x) (string=? (car x) "male")) lst))
      (f (filter (lambda (x) (string=? (car x) "female")) lst) ))  
      (append (list "Male" (/ (apply + (map cadr m)) (length m))) (list "Female" (/ (apply + (map cadr f)) (length f))))
  )
)
;(tableSum '( ("male" 178) ("female" 165) ("female" 158) ("female" 182) ("male" 161) ("male" 175) ("female" 182)("male" 188) ("male" 169) ("female" 156)))

(define (BST x bst)
  (if (null? bst)
    (list x '() '())
    (if (< (car bst) x)
      (list (car bst) (cadr bst) (BST x (caddr bst)))
      (list (car bst) (BST x (cadr bst)) (caddr bst))
    )
  )
)

;;=========================NOT WORKING=========================
;(define (search lst-neighbor b lst-not-neighbor)
;  (if (null? lst-neighbor)
;    #f

;    )
;  )
;)

;(define (pathBetweenAux a b lst)
;    (if (null? (filter (lambda (x) (= (car x) a)) lst))
;      #f
;      (search (cdar (filter (lambda (x) (= (car x) a)) lst)) b (cdar (filter (lambda (x) (not (= (car x) a))) lst)))
;    )
;)

;(define (pathBetween a b lst)
;  (if (null? lst)
;   #f
;   (or 
;      (pathBetweenAux a b lst)
;      (pathBetweenAux b a lst)
;   )
;  )
;)

;(pathBetween 1 4 '((1 2 3) (2 3 4) (3 4)))
;(pathBetween 1 2 '((1 2 3) (2 3 4) (3 4)))
;(pathBetween 1 2 '((1 2 3) (2 3 4) (3 4)))