#lang racket

;; Complete the following functions and submit your file to Canvas.

;; ========= IMPORTANT ==========
;; Change the name of the file so that it contains your student ID or name.
;; Do not change the names of the functions. The system will specifically look for the names used in this file. Changing the name of a function will automatically make you lose the points for that function.
;; Do not change the number of arguments in the functions. Changing the number of arguments of a function will automatically make you lose the points for that function.
;; Make sure that nothing additional is printed as the result of running this file. Avoid printing names, student IDs, or any other messages. If you print anything else, the system will wrongly grade your solutions.
;; If your file cannot be loaded by the Racket interpreted, your grade will be zero. Then, submit only code that works.

;Erick Francisco González Martínez
;A01039859
(define (myReverse x)
	(cond
		((empty? x) '())
	((> (length x) 0) (cons (car x) (myReverse (cdr x))))
	)
)

;(reverse '(1 2))
;(reverse '(1 2 3 4 5))
;(reverse '(0))
;(reverse '(5 4 3 2 1))

(define (myMean x)
	(/ (apply + x) (length x))
)
;(myMean '(1 2 3 4 5))
;(myMean '(1 2 3 4 5))

(define (fibonacci n)
	(if (< n 0)
		0
		(if (< n 2)
			n
			(+ (fibonacci (- n 1)) (fibonacci (- n 2)))
		)
	)
)
;(fibonacci -2)
;(fibonacci -20)
;(fibonacci -30)
;(fibonacci -45)
;(fibonacci 20)

(define (sum x)
	(if (null? x)
		0
		(if (list? (car x))
			(sum (cdr x))
			(+ (car x) (sum (cdr x)))
		)
	)
)

;(sum '(1 (2 3) 4 5))

(define (nestedSum x)
	(if (null? x)
		0
		(if (list? (car x))
			(+ (nestedSum (car x)) (nestedSum (cdr x)))
			(+ (car x) (nestedSum (cdr x)))
		)
	)
)

;(nestedSum '(1 2 3 4 5))
;(nestedSum '(1 (2 3) 2 3 4 5))

(define (removeNestedLists x)
	(if (null? x)
		null
		(if (list? (car x))
		(append (removeNestedLists (car x)) (removeNestedLists (cdr x)))
		(cons (car x) (removeNestedLists (cdr x)))
		)
	)
)

;(removeNestedLists '(1 a 2 b 3 c))
;(removeNestedLists '(1 (2 (a b) 3) (4 5 6) a 2 b 3 c))
;(removeNestedLists '(1 (2 3) (4 5 6) a 2 b 3 c))
;(removeNestedLists '(1 (2 3) a 2 b 3 c))