MIT/GNU Scheme running under OS X
Type `^C' (control-C) followed by `H' to obtain information about interrupts.

Copyright (C) 2014 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Tuesday June 2, 2015 at 12:20:18 AM
  Release 9.2 || Microcode 15.3 || Runtime 15.7 || SF 4.41 || LIAR/C 4.118
  Edwin 3.116

1 ]=> ; Exercise 1.3: Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

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
;Value: smallest-number

1 ]=> ; Answer:

(define (square a) (* a a))
;Value: square

1 ]=> (define (sum-of-squares a b)
  (+ (square a) (square b)))
;Value: sum-of-squares

1 ]=> (define (sum-of-squares-of-two-larger-numbers a b c)
  (cond ((and (< a b) (< a c)) ; a is smallest
      (sum-of-squares b c))  
    ((and (< b a) (< b c)) ; b is smallest
      (sum-of-squares a c))
    ((and (< c a) (< c b)) ; c is smallest
      (sum-of-squares a b))))
;Value: sum-of-squares-of-two-larger-numbers

1 ]=> (sum-of-squares-of-two-larger-numbers 1 2 3)
;Value: 13

1 ]=> ; should be 13
(sum-of-squares-of-two-larger-numbers 5 4 3)
;Value: 41

1 ]=> ; should be 41
(sum-of-squares-of-two-larger-numbers 6 1 2)
;Value: 40

1 ]=> ; should be 40
End of input stream reached.
Moriturus te saluto.
