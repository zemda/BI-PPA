#lang racket

(define (my-append lst1 lst2)
  (if (null? lst1)
      lst2
      (cons (car lst1) (my-append (cdr lst1) lst2))))

(define (my-length lst)
  (if (null? lst)
      0
      (+ 1 (my-length (cdr lst)))))

(define (my-split-at n lst)
  (if (= 0 n)
      (cons '() lst)
      (let ((res (my-split-at (- n 1) (cdr lst))))
        (cons (cons (car lst) (car res)) (cdr res)))))

(define (rotate lst n)
  (let* ((len (my-length lst))
         (n-mod (modulo (- len n) len))
         (split (my-split-at n-mod lst)))
    (my-append (cdr split) (car split))))


(define (transpose matrix)
  (if (null? (car matrix))
      '()
      (cons (map car matrix) (transpose (map cdr matrix)))))

(define (get-row matrix index)
  (if (= 0 index)
      (car matrix)
      (get-row (cdr matrix) (- index 1))))

(define (insert-row matrix index new-row)
  (if (null? matrix)
      '()
      (if (= 0 index)
          (cons new-row (cdr matrix))
          (cons (car matrix) (insert-row (cdr matrix) (- index 1) new-row)))))

(define (shift-row matrix index n)
  (let* ([row-to-shift (get-row matrix index)]
         [shifted-row (rotate row-to-shift n)])
    (insert-row matrix index shifted-row)))

(define (shift-column matrix index n)
    (transpose (shift-row (transpose matrix) index n)))

(define (rotate-mat matrix commands)
  (if (null? commands)
      matrix
      (let* ([command (car commands)]
             [row-or-col (car command)]
             [index (cadr command)]
             [n (caddr command)])
        (rotate-mat (if (= 0 row-or-col)
                        (shift-row matrix index n)
                        (shift-column matrix index n))
                    (cdr commands)))))


(define (test)
  (define (check-equal? x y)
    (if (equal? x y)
        (display "Test passed\n")
        (display "Test failed\n")))

  (check-equal? (rotate-mat '((1)) '((0 0 1))) '((1)))
  (check-equal? (rotate-mat '((1)) '((0 0 10))) '((1)))
  (check-equal? (rotate-mat '((1 2 3)) '((0 0 0))) '((1 2 3)))
  (check-equal? (rotate-mat '((1 2 3)) '()) '((1 2 3)))
  (check-equal? (rotate-mat '((1 2 3)) '((0 0 1))) '((3 1 2))) ;------
  (check-equal? (rotate-mat '((1 2 3)) '((0 0 1) (0 0 1))) '((2 3 1)))
  (check-equal? (rotate-mat '((1 2 3)) '((0 0 3))) '((1 2 3)))
  (check-equal? (rotate-mat '((1 2 3)) '((0 0 4))) '((3 1 2)))
  (check-equal? (rotate-mat '((1 2 3)) '((0 0 10))) '((3 1 2)))
  (check-equal? (rotate-mat '((1 2 3)) '((1 0 1))) '((1 2 3)))
  (check-equal? (rotate-mat '((1 2 3) (4 5 6)) '((1 0 1))) '((4 2 3) (1 5 6))) ;-----------------
  (check-equal? (rotate-mat '((1 2 3) (4 5 6)) '((1 0 1) (0 0 1))) '((3 4 2) (1 5 6)))
  (check-equal? (rotate-mat '((1 2 3) (4 5 6)) '((1 0 3) (0 0 4))) '((3 4 2) (1 5 6)))
  (check-equal? (rotate-mat '((1 2 3) (4 5 6)) '((1 2 1) (1 0 1))) '((4 2 6) (1 5 3)))
)

(test)