; Exercise 1.8: Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value (x/y^2 + 2y)/3. Use this formula to implement a cube-root procedure analogous to the square-root procedure. (In 1.3.4 we will see how to implement Newton’s method in general as an abstraction of these square-root and cube-root procedures.)

;; First, definitions of the various procedures needed:
;; (Note that I cubed the precision, slowing down the procedure but improving the results.)

(define (good-enough? guess previous-guess)
(< (abs (/ (- guess previous-guess) guess)) 0.000000001))

(define (apply-formula x y)
  (/ (+ (/ x (square y))
        (* 2 y))
      3))

(define (improve guess x)
  (apply-formula x guess))

(define (cube-root-iter guess previous-guess x)
  (if (good-enough? guess previous-guess)
      guess
      (cube-root-iter (improve guess x) guess x)))

(define (cube-root x)
  (cube-root-iter 1.0 0.0 x))

;; And now, examples of usage illustrating that this works across scales thanks to the ideas from 1.7:

(cube-root 8)
(cube-root 0.000000125)
(cube-root 1881365963625)