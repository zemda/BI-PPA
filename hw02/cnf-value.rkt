#lang racket

(define (lookup var values)
  (if (null? values) #f
      (if (= var (caar values))
          (cadar values)
          (lookup var (cdr values)))))


(define (clause-value clause values)
  (if (null? clause)
      #f
      (if (lookup (car clause) values)
          #t
          (clause-value (cdr clause) values)
      )))

(define (cnf-value form values)
  (if (null? form)
      #t
      (if (clause-value (car form) values)
          (cnf-value (cdr form) values)
          #f
      )))


(define (test)
  (define (check-equal? x y)
    (if (equal? x y)
        (display "Test passed\n")
        (display "Test failed\n")))

  (check-equal? (cnf-value '((0 1 2)) '((0 #f) (1 #t) (2 #f))) #t)
  (check-equal? (cnf-value '((0 1) (1 2)) '((0 #f) (1 #t) (2 #f))) #t)
  (check-equal? (cnf-value '((0) (2)) '((0 #f) (1 #t) (2 #f))) #f)
  (check-equal? (cnf-value '((0)) '((0 #f) (1 #t) (2 #f))) #f)
  (check-equal? (cnf-value '((0 1) (1 3) (2 0)) '((0 #f) (1 #t) (2 #f) (3 #t))) #f)
  (check-equal? (cnf-value '((1 0 1)) '((0 #f) (1 #t))) #t)
)

(test)