#lang racket

;Erick González A01039859
;Moisés Fernández A01197049


;;P1 Prime numbers
(define (primeAux x n)
  (cond
    ((>= n x) #t)
    ((= (remainder x n) 0) #f)
    (else (primeAux x (+ n 1)))
  )
)

(define (prime? x)
  (primeAux x 2)
)

;(prime? 4)

;Function 2
(define (countDigitsAux x)
  (if (< x 10)
    1
    (+ 1 (countDigitsAux (quotient x 10)))
  )
)

(define (countDigits l)
  (if (null? l)
    0
    (+ (countDigitsAux (car l)) (countDigits (cdr l)))
  )
)

;(countDigits '())
;(countDigits '(1 2 3 4 100))
;(countDigits '(111 22 3))

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
  (map bitwise-ior lst1 lst2)
)
;(or '(0 0 0) '(0 1 1))

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
(define (removeNestedLists x)
	(if (null? x)
		null
		(if (list? (car x))
		(append (removeNestedLists (car x)) (removeNestedLists (cdr x)))
		(cons (car x) (removeNestedLists (cdr x)))
		)
	)
)

(define (complete? lst)
  (>= (- (length (removeNestedLists lst)) (length lst)) ( / (* (length lst) (- (length lst) 1)) 2))
)

;(complete? '((a b c) (b a c) (c a b) (d e) (e d))) 
;(complete? '((a b) (b a)))
;(complete? '( (a c) (b) (c a)))

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