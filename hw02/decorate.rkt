#lang racket

(define (decorate f g)
  (lambda (x) (g (f x))))


(define (test)
  (define (check-equal? x y)
    (if (equal? x y)
        (display "Test passed\n")
        (display "Test failed\n")))
  (begin
    (check-equal? ((decorate (lambda (x) (+ x 1)) (lambda (x) (+ x 2))) 1) 4)
    (check-equal? ((decorate (lambda (lst) (foldl + 0 lst)) (lambda (x) (* x x))) '(1 2 3)) 36)
    (check-equal? ((decorate (lambda (lst) (foldl + 0 lst)) (lambda (x) (/ x 2))) '(1 2 3)) 3)
    (check-equal? ((decorate (lambda (lst) (foldl + 0 lst)) (lambda (x) (= x 0))) '()) #t)
    (check-equal? ((decorate (lambda (lst) (foldl + 0 lst)) (lambda (x) (= x 0))) '(1)) #f)
  )
)

(test)