(define (over-or-under num1 num2) (cond ((< num1 num2) -1) ((= num1 num2) 0) (else 1)))

;(define (over-or-under num1 num2) (if (< num1 num2) -1 (if (= num1 num2) 0 1))) -- can solve using nested if conditions too 

(define (composed f g) (lambda (x) (f (g x))))

(define (repeat f n) (if (= n 0) (lambda (x) x) (composed f (repeat f (- n 1)))))

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 
  
    (if (= b 0) 
      a
      (gcd b (modulo a b))
    )
)

(define (exp b n)
  (define (helper n so-far)
    (if (= n 0)
      so-far 
      (helper (- n 1) (* b so-far))
    )
  )
  (helper n 1))

(define (swap s)
  (define (helper sofar rest)
    (cond ((null? rest) sofar)
          ((null? (cdr rest)) (append sofar (list (car rest))))
          (else (helper (append sofar (list (car (cdr rest)) (car rest)))
                        (cdr (cdr rest))))))
  (helper () s)
)

(define (make-adder num) 'YOUR-CODE-HERE)
