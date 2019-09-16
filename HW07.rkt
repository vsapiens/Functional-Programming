#lang racket

;; Erick González
;; A01039859


(define (exist? x lst)
  (if (null? lst)
		#f
		(if (= x (car lst))
			#t
			(exist? x (cdr lst))
		)
	)
)
;(exist? 1 '(0 2 3 4 1))

(define (indexCounter x lst iCounter)
  (if (null? lst)
		-1
		(if (= x (car lst))
			iCounter
			(indexCounter x (cdr lst) (+ iCounter 1))
		)
	)
)

(define (index x lst)
	(indexCounter x lst 0)
)

;(index 0 '(0 7 2 8 4 5 1))
;(index 7 '(0 7 2 8 4 5 1))
;(index 2 '(0 7 2 8 4 5 1))
;(index 8 '(0 7 2 8 4 5 1))

(define (allDifferent? lst)
	(cond
		( (null? lst) #t) 
		( (not (list? lst)) #t) 
		( (exist? (car lst) (cdr lst)) #f)
		(else (allDifferent? (cdr lst)))
	)
)

;(allDifferent? '(0 7 2 8 4 5 1))
;(allDifferent? '(0 7 2 8 4 5 0))
;(allDifferent? '(0 7 2 8 4 5 7))

(define (set x)
	(if (null? x)
		null
		(if (list? (car x))
			(if (number? (car x))
				(append (set (car x)) (set (cdr x)))
				(set (cdr x))	
			)
			(cons (car x) (set (cdr x)))
		)
	)
)

;(set '(1 a 1 2 3 (1 2 3) 3))

(define (union x y)
	(display "Not yet implemented.")
)

(define (intersect x y)
  	(display "Not yet implemented.")
)

(define (det3x3 m)
	(display "Not yet implemented.") 
)