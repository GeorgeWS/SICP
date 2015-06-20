; Exercise 1.5: Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

(define (p) (p))

(define (test x y) 
  (if (= x 0) 
      0 
      y))

; Then he evaluates the expression

(test 0 (p))

; What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer. (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)



;; Applicative-order ("evaluate arguments then apply", or arguments before operators):

(test 0 (p)) ; Initial expression

(test 0 (p)) ; Argument 0 evaluates to 0, argument (p) evaluates to (p)

(test 0 (p)) ; Oh look, that gave us the same thing, and the definition of (p) hasn't changed, so…

(test 0 (p)) ; The same thing's just gonna happen again!

(test 0 (p)) ; Even though 0 was done being evaluated long ago, (p) still isn't, so we rinse and repeat.

(test 0 (p)) ; In fact, (p) is *never* done evaluating, because it always evaluates to itself.

(test 0 (p)) ; This just goes on recursively…

(test 0 (p)) ; …

(test 0 (p)) ; …

(test 0 (p)) ; …

(test 0 (p)) ; FOREVER O.O

;; In practice, this should mean that an interpreter using applicative-order evaluation will just lock up when it tries to evaluate this, because it will try to evaluate (p) forever. (In other words, it gets stuck in a recursive process.)

;; This, by the way, is what appears to be happening with our mit-scheme interpreter, as you can see from the fact that the output file doesn't even include anything after the first (test 0 (p)) line.



;; Normal-order ("expand then reduce", or operators before arguments):

(test 0 (p)) ; Initial expression
    
(if (= 0 0) ; Operator 'test' evaluates to expression shown here, with 0 and (p) substituted for x and y, respectively
    0
    (p))
    
0 ; 0 does in fact equal 0, so the expression evaluates to 0.

;; In this situation, the interpreter never tries to evaluate (p), and therefore never gets stuck. Thus, an interpreter using normal-order evaluation will evaluate (test 0 (p)) to 0 and move on without a problem.

;; If the mit-scheme interpreter were using normal-order evaulation instead of applicative-order evaluation, we would expect all of these lines to evaluate to 0 with no problem, and the output file would not be cut off at the first (test 0 (p)) line. (…Now time to go SIGQUIT the interpreter, since that's not actually what it does.)