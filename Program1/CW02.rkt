#lang racket

(define (evenlist x)

  ( if (even? (length x))

    (car x)

    (car (reverse x))
  )
)
; (evenlist '(1 2 3))
(define (thirdelement x)

  (if ( > (length x) 2)

    (list-ref x 2)
    '()

  )
)

;(thirdelement '(1 2 4))

(define (toList a b c)

  (cons a (cons b (cons ( c '() ) ) ) ) 
)

;(toList x y z)

( define (palindrome x)
  ;(equal (string->list x) (reverse (string->list x) ))
  
  (equal? (string->list x)  (reverse(string->list x)) )
)

;(palindrome "HOOH")

(define (get lst index)

  (if (not (null? lst))
    (if (and (>= index 0) (< index (length lst)))
        (if (equal? index 0)
            (car lst)
            (get (cdr lst) (- index 1))
        )
        null
    )
    null
  )
)

;(get '(1 2 3 4) 0)
;(get '(1 2 3 4) 1)
;(get '(1 2 3 4) 2)
;(get '(1 2 3 4) 3)
;(get '(1 2 3 4) 4)

(define (sum lst)
  (apply + lst)
)

;(sum '())
;(sum '(1))
;(sum '(1 2))
;(sum '(1 2 3))
;(sum '(1 2 3 4))

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
