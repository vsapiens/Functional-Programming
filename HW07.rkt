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
		( else (allDifferent? (cdr lst)))
	)
)

;(allDifferent? '(0 7 2 8 4 5 1))
;(allDifferent? '(0 7 2 8 4 5 0))
;(allDifferent? '(0 7 2 8 4 5 7))

(define (set x)
	(if (null? x)
		null
		(let(
				(lst (filter number? x)))
			(if (member (car lst) (cdr lst))
					(set (cdr lst))
					(cons (car lst) (set (cdr lst)))
			)
		)
	)
)
;(set '(1 a '(3 5) 2 3))
;(set '(1 a 1 2 3 (1 2 3) 3))

(define (union x y)
	(set (append x y))
)

(union '(1 a '(3 5) 2 3) '(1 a 1 2 3 (1 2 3) 3 4 5))

(define (intersect x y)
  	(display "Not yet implemented.")
)

(define (getElement matrix x y)
  (list-ref (list-ref matrix x) y)
)

(define (det3x3 matrix)  
    (-
      (+ 
        (* (getElement matrix 0 0) (getElement matrix 1 1) (getElement matrix 2 2))
        (* (getElement matrix 0 1) (getElement matrix 1 2) (getElement matrix 2 0))
        (* (getElement matrix 0 2) (getElement matrix 1 0) (getElement matrix 2 1))
      )
      (+
				(* (getElement matrix 2 0) (getElement matrix 1 1) (getElement matrix 0 2))
				(* (getElement matrix 2 1) (getElement matrix 1 2) (getElement matrix 0 0))
				(* (getElement matrix 2 2) (getElement matrix 1 0) (getElement matrix 0 1))
      )
    )
)
;(det3x3 '((2 1 3) (4 1 2) (3 9 3)))
