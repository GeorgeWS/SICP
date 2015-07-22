; Exercise 1.3: Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

; Work:

; Possibilities (orders on left are from largest to smallest):

; a b c -> (a > b, b > c, a > c)
; a c b -> (a > b, b < c, a > c)
; b a c -> (a < b, b > c, a > c)
; b c a -> (a < b, b > c, a < c)
; c a b -> (a > b, b < c, a < c)
; c b a -> (a < b, b < c, a < c)

(define (smallest-number a b c)
  (cond ((and (< a b) (< a c)) a)        
    ((and (< b a) (< b c)) b)
  ((and (< c a) (< c b)) c)))

; Answer:

(define (square a) (* a a))

(define (sum-of-squares a b)
  (+ (square a) (square b)))

(define (sum-of-squares-of-two-larger-numbers a b c)
  (cond ((and (< a b) (< a c)) ; a is smallest
      (sum-of-squares b c))  
    ((and (< b a) (< b c)) ; b is smallest
      (sum-of-squares a c))
    ((and (< c a) (< c b)) ; c is smallest
      (sum-of-squares a b))))
      
(sum-of-squares-of-two-larger-numbers 1 2 3) ; should be 13
(sum-of-squares-of-two-larger-numbers 5 4 3) ; should be 41
(sum-of-squares-of-two-larger-numbers 6 1 2) ; should be 40
