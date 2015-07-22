; Exercise 1.4: Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; (a-plus-abs-b a b) will evaluate to the sum of a and b if b is greater than zero, and the difference between a and b if b is less than or equal to zero. In effect, this always produces the sum of a and the absolute value of b.

; For instance, the following line should add b to a, since b is positive:

(a-plus-abs-b 2 3)

; On the other hand, the next line should subtract b from a, since b is negative, effectively adding b's absolute value to a:

(a-plus-abs-b 3 -4)
