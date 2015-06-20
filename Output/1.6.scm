MIT/GNU Scheme running under OS X
Type `^C' (control-C) followed by `H' to obtain information about interrupts.

Copyright (C) 2014 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Tuesday June 2, 2015 at 12:20:18 AM
  Release 9.2 || Microcode 15.3 || Runtime 15.7 || SF 4.41 || LIAR/C 4.118
  Edwin 3.116

1 ]=> ; Exercise 1.6: Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. “Why can’t I just define it as an ordinary procedure in terms of cond?” she asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

(define (new-if predicate
                then-clause
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
;Value: new-if

1 ]=> ; Eva demonstrates the program for Alyssa:

(new-if (= 2 3) 0 5)
;Value: 5

1 ]=> 5
;Value: 5

1 ]=> (new-if (= 1 1) 0 5)
;Value: 0

1 ]=> 0
;Value: 0

1 ]=> ; Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
;Value: sqrt-iter

1 ]=> ; What happens when Alyssa attempts to use this to compute square roots? Explain.

;; Let's start by actually defining the procedures that Alyssa's new square-root program is using, namely good-enough?, improve, and its dependency, average, as well as the actual sqrt procedure which will use sqrt-iter to compute square roots:

(define (average x y)
  (/ (+ x y) 2))
;Value: average

1 ]=> (define (improve guess x)
  (average guess (/ x guess)))
;Value: improve

1 ]=> (define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
;Value: good-enough?

1 ]=> (define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
;Value: sqrt-iter

1 ]=> (define (sqrt x)
  (sqrt-iter 1.0 x))
;Value: sqrt

1 ]=> ;; Now, if we attept to compute a square root using sqrt, the following will happen:

(sqrt 4)
;Aborting!: maximum recursion depth exceeded

1 ]=> ; Initial expression.

(sqrt-iter 1.0 4)
;Aborting!: maximum recursion depth exceeded

1 ]=> ; The only argument (4) is already evaluated, so the operator (sqrt) is applied (since mit-scheme uses applicative-order evaluation).

(new-if (good-enough? 1.0 4) ; Both arguments are again already fully evaluated, so the operator (sqrt-iter) is applied.
        1.0
        (sqrt-iter (improve 1.0 4) 4))
;Aborting!: maximum recursion depth exceeded

1 ]=> ; Now, since the interpreter uses applicative-order evaluation, all three arguments to new-if need to be evaluated before new-if is applied. The first two evaluate just fine: (good-enough? 1.0 4) is #f (using the definition of good-enough? above) and 1.0 is 1.0. However, when the third argument is evaluated, the following happens:

(sqrt-iter (improve 1.0 4) 4)
;Aborting!: maximum recursion depth exceeded

1 ]=> ; Initial expression

(sqrt-iter 2.5 4)
;Aborting!: maximum recursion depth exceeded

1 ]=> ; Arguments evaluated

(new-if (good-enough? 2.5 4) ; Operator applied
        2.5
        (sqrt-iter (improve 2.5 4) 4))
;Aborting!: maximum recursion depth exceeded

1 ]=> ; Look familiar? Now, like last time, all three arguments to new-if will be evaluated before new-if is applied. When the third argument is reached, it will again expand into another new-if expression to be evaluated with another sqrt-iter expression as its third argument (and a once-again improved guess). This will recurse indefinitely. None of the new-ifs will ever actually be applied, because their arguments will never finish evaluating, just expanding into more and more new-ifs.

; The special form `if` differes from the procedure `new-if` in that, even using applicative-order evaluation (as we were told in the parenthetical clarification in Exercise 1.5), only the true OR the false expression (i.e. the 2nd and 3rd arguments) will be evaluated depending on the truth of the predicate (i.e. the 1st argument, which is always evaluated). In the case of `new-if`, both the ture AND the false expressions are ALWAYS evaluated (as is the predicate), because evaluating ALL of the arguments is the standard behavior for procedures when using applicative-order evaluation. (If we were using normal-order evaluation, `new-if` would actually work just fine: `cond`, which, like `if`, only evaluates expressions which the predicates actually necessitate evaluating, would be substituted in for `new-if` before the arguments to `new-if` were evaluated.)

; In this case, using `new-if` leaves us with no way to break out of the recursion: even when the predicate is true (i.e. the guess is good enough), the "false" expression is still evaluated, so better and better guesses are generated indefinitely (or, in practice, until the evaluator aborts, as we see in this file's output).
End of input stream reached.
Moriturus te saluto.
