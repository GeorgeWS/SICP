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

;; f(-4) = -4
;; f(0) = 0
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

(f -4)
;Value: -4

1 ]=> (f 0)
;Value: 0

1 ]=> (f 1)
;Value: 1

1 ]=> (f 3)
;Value: 4

1 ]=> (f 5)
;Value: 25

1 ]=> ;; Analysis of (f 5):

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

;; Evaluation path:
(f 5)
;Value: 25

1 ]=> (+ (f 4) (* 2 (f 3)) (* 3 (f 2)))
;Value: 25

1 ]=> (+ (+ (f 3) (* 2 (f 2)) (* 3 (f 1))) (* 2 (f 3)) (* 3 (f 2)))
;Value: 25

1 ]=> (+ (+ (+ (f 2) (* 2 (f 1)) (* 3 (f 0))) (* 2 (f 2)) (* 3 (f 1))) (* 2 (+ (f 2) (* 2 (f 1)) (* 3 (f 0)))) (* 3 (f 2)))
;Value: 25

1 ]=> (+ (+ (+ 2 (* 2 1) (* 3 0)) (* 2 2) (* 3 1)) (* 2 (+ 2 (* 2 1) (* 3 0))) (* 3 2))
;Value: 25

1 ]=> (+ (+ (+ 2 2 0) 4 3) (* 2 (+ 2 2 0)) 6)
;Value: 25

1 ]=> (+ (+ 4 4 3) (* 2 4) 6)
;Value: 25

1 ]=> (+ 11 8 6)
;Value: 25

1 ]=> 25
;Value: 25

1 ]=> ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Iterative:

(define (f n)
  (define (iter i f-of-i-minus-1 f-of-i-minus-2 f-of-i-minus-3)
    (if (= n (- i 1))
      f-of-i-minus-1
      (iter (+ i 1)
            (+ f-of-i-minus-1 (* 2 f-of-i-minus-2) (* 3 f-of-i-minus-3))
            f-of-i-minus-1
            f-of-i-minus-2)))
  (if (< n 3)
    n
    (iter 3 2 1 0)))
;Value: f

1 ]=> ;; Examples:

(f -4)
;Value: -4

1 ]=> (f 0)
;Value: 0

1 ]=> (f 1)
;Value: 1

1 ]=> (f 3)
;Value: 4

1 ]=> (f 5)
;Value: 25

1 ]=> ;; Iteration rules (for i ≥ 3):

;; i = i + 1
;; f-of-i-minus-1 = (f-of-i-minus-1 + 2 * f-of-i-minus-2 + 3 * f-of-i-minus-3)
;; f-of-i-minus-2 = f-of-i-minus-1
;; f-of-i-minus-3 = f-of-i-minus-2

;; Analysis of (f 5):

;; Iterations:
;; i = 3: f-of-i-minus-1 = (2 + 2(1) + 3(0)) = 4, f-of-i-minus-2 = 2, f-of-i-minus-3 = 1, i = 4
;; i = 4: f-of-i-minus-1 = (4 + 2(2) + 3(1)) = 11, f-of-i-minus-2 = 4, f-of-i-minus-3 = 2, i = 5
;; i = 5: f-of-i-minus-1 = (11 + 2(4) + 3(2)) = 25, f-of-i-minus-2 = 11, f-of-i-minus-3 = 4, i = 6
;; i = 6: return f-of-i-minus-1 = 25

;; Redundancy counts:
;; f(5): evaluated 1 time
;; f(4): evaluated 1 time
;; f(3): evaluated 1 time
;; f(2): never evaluated (specified in initial input to iter)
;; f(1): never evaluated (specified in initial input to iter)
;; f(0): never evaluated (specified in initial input to iter)

;; Evaluation path:
(iter 3 2 1 0)
;Unbound variable: iter
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify a value to use instead of iter.
; (RESTART 2) => Define iter to a given value.
; (RESTART 1) => Return to read-eval-print level 1.

2 error> ;; n = 5 ≠ i - 1 = 2
(iter 4 4 2 1)
;Unbound variable: iter
;To continue, call RESTART with an option number:
; (RESTART 4) => Specify a value to use instead of iter.
; (RESTART 3) => Define iter to a given value.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

3 error> ;; n = 5 ≠ i - 1 = 3
(iter 5 11 4 2)
;Unbound variable: iter
;To continue, call RESTART with an option number:
; (RESTART 5) => Specify a value to use instead of iter.
; (RESTART 4) => Define iter to a given value.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

4 error> ;; n = 5 ≠ i - 1 = 4
(iter 6 25 11 4)
;Unbound variable: iter
;To continue, call RESTART with an option number:
; (RESTART 6) => Specify a value to use instead of iter.
; (RESTART 5) => Define iter to a given value.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

5 error> ;; n = 5 = i - 1 = 5 -> f-of-i-minus-1
25
;Value: 25

5 error> ;; Wow! Iteration is so much more efficient than recursion for something like this! (Look how many fewer steps it takes, and how much less redundant it is!)
End of input stream reached.
Moriturus te saluto.
