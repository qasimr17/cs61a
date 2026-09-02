(define (square n) (* n n))

(define (pow base exp) 
  (cond 
    ((= exp 0) 1)
    ((odd? exp) (* base (pow base (- exp 1))))
    (else (square (pow base (/ exp 2))))
  )
)

(define (repeatedly-cube n x)
  (if (zero? n)
      x 
      (begin (define y (repeatedly-cube (- n 1) x)) (* y y y))
  )
)

; another solution using pow function defined earlier
;(define (repeatedly-cube n x)
; (if (zero? n)
;      x
;      (begin (define y (pow x 3)) (repeatedly-cube (- n 1) y)))
;)

(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cddr s)))
