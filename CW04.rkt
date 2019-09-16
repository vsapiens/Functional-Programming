#lang racket

;Lambda Functions
(define (calculate)
  ((lambda (x y) (+ x y)) 5 6)
)

;Filtering Lists
(define (myFilter)
  (filter (lambda (x) (= (remainder x 7) 0)) '(1 2 3 7 14 21))
)

;Sum of Numbers - Recursion
(define (sum x)
	(if (null? x)
		0
		(if (list? (car x))
			(sum (cdr x))
			(+ (car x) (sum (cdr x)))
		)
	)
)

;(sum '(1 2 3 5 6 7 8))

;Sum of numbers - Higher order functions
(define (sumHigh lst)
  (apply + lst)
)
;(sumHigh'(1 2 3 5 6 7 8))

;Graphs
(define (edgeList? graph nodes)
  (not (empty? (filter (lambda (x) (= nodes x)) graph)))
)

;(edgeList? '((a b c) (b a) (b c)) '(a b))
;Matrix Sum
(define (row-sum rowA rowB)
  (if (null? rowA)
    '()
    (cons (+ (car rowA) (car rowB)) (row-sum (cdr rowA) (cdr rowB)))
  )
)
    
(define (matrix-sum matrixA matrixB)
  (if (null? matrixA)
    '()
    (cons(row-sum (car matrixA) (car matrixB)) 
    (matrix-sum (cdr matrixA) (cdr matrixB)))
  )
)

(matrix-sum '((1 2 3) (4 5 6) (7 8 9)) '((1 2 3) (4 5 6) (7 8 9)))

;Check Balance

(define (checkIn lst)
  (if (null? lst)
    0
    (if (string=? (caar lst) "in")
      (+ (car( reverse (car lst))) (checkIn (cdr lst)))
      (checkIn (cdr lst))
    )
  )
)

(define (checkOut lst)
  (if (null? lst)
    0
    (if (string=? (caar lst) "out")
      (+ (car( reverse (car lst))) (checkOut (cdr lst)))
      (checkOut (cdr lst))
    )
  )
)
(define (checkBalance lst)
  (- (checkIn lst) (checkOut lst))
)

;(checkBalance '(("in" "Salary" 4000) ("in" "Parents" 2000) ("out" "Rent" 3500) ("out" "food" 750) ("out" "hobbies" 400) ("in" "Scholarship" 2500)))