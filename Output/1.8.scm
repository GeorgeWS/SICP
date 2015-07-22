MIT/GNU Scheme running under OS X
Type `^C' (control-C) followed by `H' to obtain information about interrupts.

Copyright (C) 2014 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Tuesday June 2, 2015 at 12:20:18 AM
  Release 9.2 || Microcode 15.3 || Runtime 15.7 || SF 4.41 || LIAR/C 4.118
  Edwin 3.116

1 ]=> ; Exercise 1.8: Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value (x/y^2 + 2y)/3. Use this formula to implement a cube-root procedure analogous to the square-root procedure. (In 1.3.4 we will see how to implement Newton’s method in general as an abstraction of these square-root and cube-root procedures.)

;; First, definitions of the various procedures needed:
;; (Note that I cubed the precision, slowing down the procedure but improving the results.)

(define (good-enough? guess previous-guess)
(< (abs (/ (- guess previous-guess) guess)) 0.000000001))
;Value: good-enough?

1 ]=> (define (apply-formula x y)
  (/ (+ (/ x (square y))
        (* 2 y))
      3))
;Value: apply-formula

1 ]=> (define (improve guess x)
  (apply-formula x guess))
;Value: improve

1 ]=> (define (cube-root-iter guess previous-guess x)
  (if (good-enough? guess previous-guess)
      guess
      (cube-root-iter (improve guess x) guess x)))
;Value: cube-root-iter

1 ]=> (define (cube-root x)
  (cube-root-iter 1.0 0.0 x))
;Value: cube-root

1 ]=> ;; And now, examples of usage illustrating that this works across scales thanks to the ideas from 1.7:

(cube-root 8)
;Value: 2.

1 ]=> (cube-root 0.000000125)
;Value: .005

1 ]=> (cube-root 1881365963625)
;Value: 12345.

1 ]=> 
End of input stream reached.
Moriturus te saluto.
