MIT/GNU Scheme running under OS X
Type `^C' (control-C) followed by `H' to obtain information about interrupts.

Copyright (C) 2014 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Tuesday June 2, 2015 at 12:20:18 AM
  Release 9.2 || Microcode 15.3 || Runtime 15.7 || SF 4.41 || LIAR/C 4.118
  Edwin 3.116

1 ]=> ; Exercise 1.1: Below is a sequence of expressions. What is the result printed by the interpreter in response to each expression? Assume that the sequence is to be evaluated in the order in which it is presented.

10
;Value: 10

1 ]=> ; 10

(+ 5 3 4)
;Value: 12

1 ]=> ; 12

(- 9 1)
;Value: 8

1 ]=> ; 8

(/ 6 2)
;Value: 3

1 ]=> ; 3

(+ (* 2 4) (- 4 6))
;Value: 6

1 ]=> ; 6

(define a 3)
;Value: a

1 ]=> ; interpreter's response is implementation dependent; see footnote 8
; (note: the value of a is now 3)

(define b (+ a 1))
;Value: b

1 ]=> ; ditto
; (note: the value of b is now 4)

(+ a b (* a b))
;Value: 19

1 ]=> ; 19

(= a b)
;Value: #f

1 ]=> ; #f

(if (and (> b a) (< b (* a b)))
	b
	a)
;Value: 4

1 ]=> ; 4

(cond ((= a 4) 6)
	  ((= b 4) (+ 6 7 a))
	  (else 25))
;Value: 16

1 ]=> ; 16

(+ 2 (if (> b a) b a))
;Value: 6

1 ]=> ; 6

(* (cond ((> a b) a)
		 ((< a b) b)
		 (else -1))
   (+ a 1))
;Value: 16

1 ]=> ; 16
End of input stream reached.
Moriturus te saluto.
