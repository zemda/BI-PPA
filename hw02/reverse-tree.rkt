#lang racket


(define (reverse-tree bst)
  (if (null? bst)
      '()
      (let* ([root (car bst)]
             [left (cadr bst)]
             [right (caddr bst)]
             [reversed-left (reverse-tree left)]
             [reversed-right (reverse-tree right)])
        (cons root (cons reversed-right (cons reversed-left '()))))))


(define (test)
  (define (check-equal? x y)
    (if (equal? x y)
        (display "Test passed\n")
        (display "Test failed\n")))
  (check-equal? (reverse-tree '()) '())
  (check-equal? (reverse-tree '(1 () ())) '(1 () ()))
  (check-equal? (reverse-tree '(1 (2 () ()) ())) '(1 () (2 () ())))
  (check-equal? (reverse-tree '(2 (1 () ()) (3 () ()))) '(2 (3 () ()) (1 () ())))
  (check-equal? (reverse-tree '(10 (5 (3 () ()) ()) (20 () (25 () ())))) '(10 (20 (25 () ()) ()) (5 () (3 () ())))))

(test)
