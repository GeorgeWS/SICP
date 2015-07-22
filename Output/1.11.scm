MIT/GNU Scheme running under OS X
Type `^C' (control-C) followed by `H' to obtain information about interrupts.

Copyright (C) 2014 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Tuesday June 2, 2015 at 12:20:18 AM
  Release 9.2 || Microcode 15.3 || Runtime 15.7 || SF 4.41 || LIAR/C 4.118
  Edwin 3.116

1 ]=> ; Exercise 1.11: A function f is defined by the rule that f(n) = n if n < 3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n ≥ 3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.”

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Expected results for examples:

;; f(1) = 1
;; f(3) = f(2) + 2f(1) + 3f(0) = 2 + 2 + 0 = 4
;; f(5) = f(4) + 2f(3) + 3f(2) = (f(3) + 2f(2) + 3f(1)) + 2(4) + 6 = (4 + 4 + 3) + 8 + 6 = 11 + 8 + 6 = 25

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Recursive:


(define (f n)
  (if (< n 3)
    n
    (+ (f (- n 1))
       (* 2 (f (- n 2)))
       (* 3 (f (- n 3))))))
;Value: f

1 ]=> ;; Examples:

(f 1)
;Value: 1

1 ]=> (f 3)
;Value: 4

1 ]=> (f 5)
;Value: 25

1 ]=> ;; Evaluation process:

;; Levels of recursion tree:
;; tree depth = 0: f(5)
;; tree depth = 1: f(4) + 2f(3) + 3f(2)
;; tree depth = 2: (f(3) + 2f(2) + 3f(1)) + 2(f(2) + 2f(1) + 3f(0)) + 3(2)
;; tree depth = 3: ((f(2) + 2f(1) + 3f(0)) + 2(2) + 3(1)) + 2(2 + 2(1) + 3(0)) + 3(2)
;; tree depth = 4: ((2 + 2(1) + 3(0)) + 2(2) + 3(1)) + 2(2 + 2(1) + 3(0)) + 3(2)

;; Redundancy counts:
;; f(5): evaluated 1 time
;; f(4): evaluated 1 time
;; f(3): evaluated 2 times
;; f(2): evaluated 4 times
;; f(1): evaluated 3 times
;; f(0): evaluated 2 times

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Iterative:

(define (f n)
(f-iter 0 0 0 0 n))
;Value: f

1 ]=> (define (f-iter a f-prev f-2-prev f-3-prev n)
  (if (= (- a 1) n)
    f-prev
    (cond ((= a 0) (f-iter 1 0 0 0 n))
          ((= a 1) (f-iter 2 1 0 0 n))
          ((= a 2) (f-iter 3 2 1 0 n))
          (else (f-iter
                  (+ a 1)
                  (+ f-prev (* 2 f-2-prev) (* 3 f-3-prev))
                  f-prev
                  f-2-prev
                  n)))))
;Value: f-iter

1 ]=> ;; Examples:

(f 1)
;Value: 1

1 ]=> (f 3)
;Value: 4

1 ]=> (f 5)
;Value: 25

1 ]=> 
End of input stream reached.
Moriturus te saluto.
