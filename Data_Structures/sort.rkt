#lang racket

(define (insert-in-place element array)
  (cond(
    (null? array) (list element))
    ((< element (car array)) (cons element array))
    (else (cons (car array) (insert-in-place element (cdr array))))
    )
)
    
    
(define (sort array)
  (if (null? array) 
    null
    (insert-in-place (car array) (sort (cdr array)))
  )
)
