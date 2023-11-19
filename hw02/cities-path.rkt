#lang racket


(define (my-ormap func list)
  (if (null? list)
      #f
      (if (func (car list))
          #t
          (my-ormap func (cdr list)))))

(define (is-in-list? element list)
  (if (null? list) 
      #f
      (if (equal? element (car list)) 
          #t
          (is-in-list? element (cdr list)))))

(define (dfs paths current to visited)
  (if (equal? current to)
      #t
      (if (is-in-list? current visited)
          #f
          (let ([next-cities (map cadr (filter (lambda (path) (equal? (car path) current)) paths))]) ;vesmes for each neighbor, ulozime si ty neigbory do "setu" neighbors
            (if (null? next-cities)
                #f
                (my-ormap (lambda (city) (dfs paths city to (cons current visited))) next-cities)))))) ;pro kazde sousedni mesto zavola dfs s updatnutym visited a if najde cestu, ret #t


(define (cities-path? paths from to)
  (dfs paths from to '()))



(define (test)
  (define (check-equal? x y)
    (if (equal? x y)
        (display "Test passed\n")
        (display "Test failed\n")))

  (check-equal? (cities-path? '() 1 2) #f)
  (check-equal? (cities-path? '() 2 2) #t)
  (check-equal? (cities-path? '((1 2)) 1 2) #t)
  (check-equal? (cities-path? '((1 2)) 1 3) #f)
  (check-equal? (cities-path? '((1 2)) 2 1) #f)
  (check-equal? (cities-path? '((2 1)) 1 2) #f)
  (check-equal? (cities-path? '((1 2) (2 1)) 1 2) #t)
  (check-equal? (cities-path? '((1 2) (2 1)) 2 1) #t)
  (check-equal? (cities-path? '((1 2) (2 3) (3 4) (4 2)) 1 2) #t)
  (check-equal? (cities-path? '((1 2) (2 3) (3 4) (4 2)) 1 3) #t)
  (check-equal? (cities-path? '((1 2) (2 3) (3 4) (4 2)) 1 4) #t)
  (check-equal? (cities-path? '((1 2) (2 3) (3 4) (4 2)) 2 3) #t)
  (check-equal? (cities-path? '((1 2) (2 3) (3 4) (4 2)) 2 4) #t)
  (check-equal? (cities-path? '((4 2) (3 4) (2 3) (1 2)) 3 2) #t)
  (check-equal? (cities-path? '() 100 100) #t)
)

(test)