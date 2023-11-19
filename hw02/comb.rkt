#lang racket


(define (comb lst n)
  (cond
    [(null? lst) (if (= n 0) 1 0)]
    [(> (car lst) n) (comb (cdr lst) n)]
    [#t (+ (comb (cdr lst) n) (comb (cdr lst) (- n (car lst))))]))


(define (test)
  (define (check-equal? x y)
    (if (equal? x y)
        (display "Test passed\n")
        (display "Test failed\n")))

  (check-equal? (comb '(1) 1) 1)
  (check-equal? (comb '(1 1) 1) 2)
  (check-equal? (comb '(1 1) 2) 1)
  (check-equal? (comb '(1 1 1 2) 3) 4)
  (check-equal? (comb '(1 2 1 2) 3) 4)
  (check-equal? (comb '(1 3 4 2) 3) 2)
  (check-equal? (comb '(1 2 3 4 5) 15) 1)
  (check-equal? (comb '(1 2 3 4 5) 10) 3)
  (check-equal? (comb '(1 2 3 4 5) 5) 3)
)

(test)