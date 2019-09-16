#lang racket


(define (quickSort lst)
  (if (null? lst)
    null
    (append
      (quickSort (filter (lambda (num) (<= num (car lst))) (cdr lst)))
      (list (car l))
      (quickSort (filter (lambda (num) (> num (car lst))) (cdr lst)))
    )
  )
)

(define (matrMul matrix1 matrix2)
  (map
   (lambda (row) (apply map  (lambda column  (apply + (map * row column) ) matrix2)   )
   matrix1)
)

;(matrMul '((1 2 3) (4 5 6) (7 8 9)) '((1 2 3) (4 5 6) (7 8 9)))

(define (tableSum lst)
  (let 
    (
      (m (filter (lambda (x) (string=? (car x) "male")) lst))
      (f (filter (lambda (x) (string=? (car x) "female")) lst)))  
      (append (list "Male" (/ (apply + (map cadr m)) (length m))) (list "Female" (/ (apply + (map cadr f)) (length f))))
  )
)
;(tableSum '( ("male" 178) ("female" 165) ("female" 158) ("female" 182) ("male" 161) ("male" 175) ("female" 182)("male" 188) ("male" 169) ("female" 156)))

(define (BST)
  (if (null? BST)
    (list x '() '())
    (if (< (car BST) x)
      (list (car BST) (cadr BST) (insert x (caddr BST)))
      (list (car BST) (insert x (cadr BST)) (caddr BST))
    )
  )
)

(define (pathBetween)
  (display "Not implemented")
)