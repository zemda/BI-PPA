#lang racket


(define (coffee-shop-aux local_max prev max lst)
  (cond
    [(null? lst) (if (> local_max max) local_max max)]
    [(equal? (car lst) prev) (coffee-shop-aux (+ 1 local_max) (car lst) (if (> local_max max) local_max max) (cdr lst))]
    [(not (null? lst)) (coffee-shop-aux 1 (car lst) (if (> local_max max) local_max max) (cdr lst))]))

(define (coffee-shop times)
  (if (null? times)
      0
      (coffee-shop-aux 1 (car times) 0 (cdr times))))

(define (test)
  (define (check-equal? x y)
    (if (equal? x y)
        (display "Test passed\n")
        (display "Test failed\n")))

  (check-equal? (coffee-shop '((8 0) (8 10) (8 10) (8 45))) 2)
  (check-equal? (coffee-shop '((8 12) (10 11) (10 11) (15 15) (15 15) (15 15) (22 22) (22 22) (22 59))) 3)
  (check-equal? (coffee-shop '()) 0)
)

(test)