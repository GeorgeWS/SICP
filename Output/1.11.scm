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

(f 0)
;Value: 0

1 ]=> (f 1)
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
  (define (iter i f-of-i-minus-1 f-of-i-minus-2 f-of-i-minus-3)
    (if (= n (- i 1))
      f-of-i-minus-1
      (iter (+ i 1)
            (if (< i 3)
              i
              (+ f-of-i-minus-1 (* 2 f-of-i-minus-2) (* 3 f-of-i-minus-3)))
            f-of-i-minus-1
            f-of-i-minus-2)))
  (iter 0 0 0 0))
;Value: f

1 ]=> ;; Evaluation process:

;; Rules:
;; if i<3: i=i+1, prev=i, 2-prev=prev, 3-prev=2-prev
;; if i≥3: i=i+1, prev=(prev+2*2-prev+3*3-prev)

;; Iterations for n=5:
;; i=0, prev=0, 2-prev=0, 3-prev=0: i=i+1

;; Examples:

(f 0)
;Value: 0

1 ]=> (f 1)
;Value: 1

1 ]=> (f 3)
;Value: 4

1 ]=> (f 5)
;Value: 25

1 ]=>
End of input stream reached.
Moriturus te saluto.
