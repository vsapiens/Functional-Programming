#lang racket

;;; Insertion sort
;;; ===================================

(define (insert-in-place element array)
	(cond 
		((null? array) (list element))
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

(display " == Insertion sort ==\n")
(sort '(10 4 8 9 6 2))
(sort '(1 2 5 7))
(sort '(10 4 2 1 0))

;;; Sum of matrices
;;; ===================================
(define (row-sum rowA rowB)
	(if (null? rowA)
		0
		(+ (car rowA) (car rowB) (row-sum (cdr rowA) (cdr rowB)))
	)
)

(define (matrix-sum matrixA matrixB)
	(if (null? matrixA)
		0
		(+ (row-sum (car matrixA) (car matrixB)) (matrix-sum (cdr matrixA) (cdr matrixB)))
	)
)

(display "== Matrix addition == \n")
(matrix-sum '((10 4 8) (4 7 10)) '((9 6 2) (3 2 11)))

;;; Records and tables
;;; ===================================

(define (get-field field record)
	(if (null? record)
		null
		(if (equal? (car (car record)) field)
			(cdr (car record))
			(get-field field (cdr record))
		)
	)
)

(define (get-records table field op condition)
	(if (null? table)
		null
		(let ((value (get-field field (car table))))		
			(if (op (car value) condition)
				(cons (get-field 'id (car table)) (get-records (cdr table) field op condition))
				(get-records (cdr table) field op condition)
			)				
		)
	)
)

(display "== Tables ==\n")
(define records '(
		((id 796623) (name Rodrigo) (last-name Orozco) (grade 89)) 
		((id 101224) (name Juan) (last-name Carrasco) (grade 91)) 
		((id 982112) (name Erika) (last-name Gallardo) (grade 97))
		((id 662544) (name Karla) (last-name Durante) (grade 90))
		((id 727331) (name Damian) (last-name Espinoza) (grade 85))
	)	
)
(get-records records 'grade > 90)

;;; Stacks
;;; ===================================

(define (push element stack)
	(cons element stack)
)

(define (pop stack)
	(cdr stack)
)

(define (peek stack)
	(car stack)
)

(display "== Stacks ==\n")
(peek (push 10 (pop (push 3 (push 4 '())))))

;;; Queues
;;; ===================================

(define (insert element queue)
	(append queue (list element))
)

(define (remove queue)
	(cdr queue)
)

(define (first queue)
	(car queue)
)

(display "== Queues ==\n")
(insert 4 (remove (insert 3 (insert 2 (insert 1 '())))))

;;; Binary search trees
;;; ===================================

(define (search element tree)
	(cond 
		((null? tree) #f)
		((= element (car tree)) #t)
		(else (if (< element (car tree))
					(search element (cadr tree))
					(search element (caddr tree))
				)
		)		
	) 
)

(display "== Binary search tres ==\n")
(define tree '(10 
	(5 
		(1 
			(2 () ())
			(4 () ())
		)
		(6 ()	())
	) 
	(12 
		() 
		(14 () ())
	)
))

(search 9 tree)

;;; Graphs
;;; ===================================

(define (max-degree graph)
	(if (null? graph)
		0
		(max (- (length (car graph)) 1) (max-degree (cdr graph)))
	)
)

(display "== Graphs ==\n")
(max-degree '((a b c) (b a c d) (c a b) (d b)))

