; Exercise 1.7: The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

;; Okay. Let's do this. First, here are the original definitions of `good-enough?` and related procedures:

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; Here's what happens when it's used with a very small number:

(sqrt 0.00000004)

;; We can see how much the result is off by squaring it:

(square (sqrt 0.00000004))

;; The result is off by a lot because it is "good enough" according to the rule that the squared guess must be within 0.001 of the radicand (i.e. x, the argument to sqrt). Since the radicand is smaller than 0.001 to begin with, determining whether a guess is correct requires a much higher level of precision.

;; Here's what happens when sqrt is used on larger and larger numbers:

(square (sqrt 9)) ; These ones are all off by smaller and smaller relative amounts
(square (sqrt 99))
(square (sqrt 999))
(square (sqrt 9999))
(square (sqrt 99999))
(square (sqrt 999999))
(square (sqrt 9999999)) ; This one is correct
(square (sqrt 99999999)) ; These ones are all off by smaller and smaller amounts again
(square (sqrt 999999999))
(square (sqrt 9999999999))
(square (sqrt 99999999999))
(square (sqrt 999999999999)) ; These ones are all correct
(square (sqrt 9999999999999))
(square (sqrt 99999999999999))
(square (sqrt 999999999999999))
(square (sqrt 9999999999999999))
;(square (sqrt 99999999999999999)) ; This one hangs and never exits
(square (sqrt 999999999999999999)) ; These ones use scientific notation
(square (sqrt 9999999999999999999))
(square (sqrt 99999999999999999999))

(square (sqrt 1)) ; This one is correct
(square (sqrt 10)) ; These ones are all off by smaller and smaller relative amounts
(square (sqrt 100))
(square (sqrt 1000))
(square (sqrt 10000))
(square (sqrt 100000))
(square (sqrt 1000000))
(square (sqrt 10000000))
(square (sqrt 100000000)) ; This one is correct
(square (sqrt 1000000000)) ; Slightly off
(square (sqrt 10000000000)) ; Correct
(square (sqrt 100000000000)) ; Slightly off
(square (sqrt 1000000000000)) ; Correct
;(square (sqrt 10000000000000)) ; Hangs and never exits
(square (sqrt 100000000000000)) ; Correct
;(square (sqrt 1000000000000000)) ; Hangs and never exits
(square (sqrt 10000000000000000)) ; Correct
;(square (sqrt 100000000000000000)) ; Hangs and never exits
(square (sqrt 1000000000000000000)) ; Correct

; It's interesting to note the pattern that all the 1s with an odd number of 0s seem to cause more trouble than the 1s with an even number of 0s. This is presumably because their square roots require greater precision to represent. (For instance, √1,000,000,000,000 (12 zeros) = 1,000,000 while √10,000,000,000,000 (13 zeros) ≈ 3,162,277.66016837933…, which is an irrational number whose decimal places exend out indefinitely.)

; These ones cause problems as well:
;(sqrt 9999999999999999999999)
;(sqrt 9898989898989898)

;; The good-enough? test uses a fixed precision of 0.001 when determining how close a squared guess must be to the radicand. For very small numbers, this means that the good-enough? test will evaluate to true even when the guess is far off, because the test is too imprecise. For very large numbers, this means the good-enough? test may never evaluate to true, particularly when the square root is an irrational number which must be computed to a greater degree of precision than is possible for the computer in order for its square to be within 0.001 of the radicand.

;; The solution to this is to test the *percent error* in good-enough? rather than the *absolute error*, as per the book's suggestion.

;; Here is how this might look:

(define (good-enough? guess previous-guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.001))

(define (sqrt-iter guess previous-guess x)
  (if (good-enough? guess previous-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (sqrt x)
  (sqrt-iter 1.0 0.0 x))
  
;; We can see the improvement when we run the previous examples:

;; First, a small number:

(square (sqrt 0.00000004))

;; And now, the large numbers that were causing problems:

(square (sqrt 99999999999999999)) ; No longer hangs
(square (sqrt 10000000000000)) ; No longer hangs
(square (sqrt 1000000000000000)) ; No longer hangs
(square (sqrt 100000000000000000)) ; No longer hangs

; Now we can improve the precision of our answers simply by decreasing the acceptible percent error in good-enough? from 0.001 to something more precise, say, 0.00001. Importantly, this will now increase the precision of answers *across all scales*.