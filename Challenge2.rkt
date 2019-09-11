#lang racket

;Erick González
;A01039859

(define (primeAux x n)

(cond
  ((>= n x) #t)
  (((= (remainder x n)) 0) #f)
  (else (primeAux x (+ n 1)))
)
)
(define (prime x)
(primeAux x 2)
)
;(define (countAux n)
;  (cond
;  (>= )
;  )
;)
;(define (count lst)
;  (if(null? lst)
;    (+ (countAux (car x)))
;    (count (cdr lst))
;  )
;)

;(define (count lst)
  ;(apply (number->string) lst)
 ; (if (null? x)
  ;(string-length( append (number->string (car lst)) (count(cdr lst))))
 ; null
 ; )
;)



;Function 2
;(define (countDigits lst)
;)

;Function 3

(define (appendLists x y)
	(if (list? x)
		(if (list? y)
			(append x y)
			'()
		)
		(if (list? y)
			'()
			(list y x)
		)
	)
)

(define (merge lst1 lst2)
  (sort (appendLists lst1 lst2) <)
)

;(merge '(1 2 3) '(2 3 4 5))

;Function 4
(define (or lst1 lst2)
 (if ((null? lst1) 1 (null? lst2))
      null
      (if (and (list? (cdr lst1)) (list? (cdr lst2)))
        (or (cdr lst1) (cdr lst2))
        (+ (+ (car lst1) (car lst2) (or (cdr lst1) (cdr lst2))))
      )
  )
)
(or '(1 0 0) '(0 1 1))

;Function 5
(define (listToNum lst)
  (if (null? lst)
    0
      (if (list? (car lst))
        (listToNum (cdr lst))
        (+ (* (car lst) (expt 10 (- (length lst) 1))) (listToNum (cdr lst)))
      )
  )
)
;(listToNum '(1 2 3 4 5))

;Function 6
;(define (complete lst)) 

;Function 7
(define (sumMat x) 
	(if (null? x)
		0
		(if (list? (car x))
			(+ (sumMat (car x)) (sumMat (cdr x)))
			(+ (car x) (sumMat (cdr x)))
		)
	)
)

;(sumMat '((1 2 3) (2 4 5) (3 4 5)))