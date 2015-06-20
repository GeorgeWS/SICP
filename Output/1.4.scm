MIT/GNU Scheme running under OS X
Type `^C' (control-C) followed by `H' to obtain information about interrupts.

Copyright (C) 2014 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Tuesday June 2, 2015 at 12:20:18 AM
  Release 9.2 || Microcode 15.3 || Runtime 15.7 || SF 4.41 || LIAR/C 4.118
  Edwin 3.116

1 ]=> ; Exercise 1.4: Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;Value: a-plus-abs-b

1 ]=> ; (a-plus-abs-b a b) will evaluate to the sum of a and b if b is greater than zero, and the difference between a and b if b is less than or equal to zero. In effect, this always produces the sum of a and the absolute value of b.

; For instance, the following line should add b to a, since b is positive:

(a-plus-abs-b 2 3)
;Value: 5

1 ]=> ; On the other hand, the next line should subtract b from a, since b is negative, effectively adding b's absolute value to a:

(a-plus-abs-b 3 -4)
;Value: 7

1 ]=> 
End of input stream reached.
Moriturus te saluto.
