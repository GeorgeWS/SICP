MIT/GNU Scheme running under OS X
Type `^C' (control-C) followed by `H' to obtain information about interrupts.

Copyright (C) 2014 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Tuesday June 2, 2015 at 12:20:18 AM
  Release 9.2 || Microcode 15.3 || Runtime 15.7 || SF 4.41 || LIAR/C 4.118
  Edwin 3.116

1 ]=> ; Exercise 1.10: The following procedure computes a mathematical function called Ackermann‚Äôs function.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
;Value: a

1 ]=> ; What are the values of the following expressions?

(A 1 10)
;Value: 1024

1 ]=> (A 2 4)
;Value: 65536

1 ]=> (A 3 3)
;Value: 65536

1 ]=> ; Consider the following procedures, where A is the procedure defined above:

(define (f n) (A 0 n))
;Value: f

1 ]=> (define (g n) (A 1 n))
;Value: g

1 ]=> (define (h n) (A 2 n))
;Value: h

1 ]=> (define (k n) (* 5 n n))
;Value: k

1 ]=> ; Give concise mathematical definitions for the functions computed by the procedures f, g, and h for positive integer values of n. For example, (k n) computes 5n^2.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; The value of (A 1 10) is‚Ä¶

(A 1 10)
;Value: 1024

1 ]=> (A 0 (A 1 9))
;Value: 1024

1 ]=> (A 0 (A 0 (A 1 8)))
;Value: 1024

1 ]=> (A 0 (A 0 (A 0 (A 1 7))))
;Value: 1024

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 1 6)))))
;Value: 1024

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
;Value: 1024

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
;Value: 1024

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
;Value: 1024

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
;Value: 1024

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
;Value: 1024

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
;Value: 1024

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
;Value: 1024

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
;Value: 1024

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
;Value: 1024

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 32)))))
;Value: 1024

1 ]=> (A 0 (A 0 (A 0 (A 0 64))))
;Value: 1024

1 ]=> (A 0 (A 0 (A 0 128)))
;Value: 1024

1 ]=> (A 0 (A 0 256))
;Value: 1024

1 ]=> (A 0 512)
;Value: 1024

1 ]=> 1024
;Value: 1024

1 ]=> ;; The value of (A 2 4) is‚Ä¶

(A 2 4)
;Value: 65536

1 ]=> (A 1 (A 2 3))
;Value: 65536

1 ]=> (A 1 (A 1 (A 2 2)))
;Value: 65536

1 ]=> (A 1 (A 1 (A 1 (A 2 1))))
;Value: 65536

1 ]=> (A 1 (A 1 (A 1 2)))
;Value: 65536

1 ]=> (A 1 (A 1 (A 0 (A 1 1))))
;Value: 65536

1 ]=> (A 1 (A 1 (A 0 2)))
;Value: 65536

1 ]=> (A 1 (A 1 4))
;Value: 65536

1 ]=> (A 1 (A 0 (A 1 3)))
;Value: 65536

1 ]=> (A 1 (A 0 (A 0 (A 1 2))))
;Value: 65536

1 ]=> (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
;Value: 65536

1 ]=> (A 1 (A 0 (A 0 (A 0 2))))
;Value: 65536

1 ]=> (A 1 (A 0 (A 0 4)))
;Value: 65536

1 ]=> (A 1 (A 0 8))
;Value: 65536

1 ]=> (A 1 16)
;Value: 65536

1 ]=> (A 0 (A 1 15))
;Value: 65536

1 ]=> (A 0 (A 0 (A 1 14)))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 1 13))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 1 12)))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 11))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 10)))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 1024))))))
;Value: 65536

1 ]=> ;; Substitution of 1024 for (A 1 10)
(A 0 (A 0 (A 0 (A 0 (A 0 2048)))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 4096))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 8192)))
;Value: 65536

1 ]=> (A 0 (A 0 16384))
;Value: 65536

1 ]=> (A 0 32768)
;Value: 65536

1 ]=> 65536
;Value: 65536

1 ]=> ;; The value of (A 3 3) is‚Ä¶

(A 3 3)
;Value: 65536

1 ]=> (A 2 (A 3 2))
;Value: 65536

1 ]=> (A 2 (A 2 (A 3 1)))
;Value: 65536

1 ]=> (A 2 (A 2 2))
;Value: 65536

1 ]=> (A 2 (A 1 (A 2 1)))
;Value: 65536

1 ]=> (A 2 (A 1 2))
;Value: 65536

1 ]=> (A 2 (A 0 (A 1 1)))
;Value: 65536

1 ]=> (A 2 (A 0 2))
;Value: 65536

1 ]=> (A 2 4)
;Value: 65536

1 ]=> 65536
;Value: 65536

1 ]=> ;; Substitution of 65536 for (A 2 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; And now the last two, again, with no substitution, just to see how pretty all the recursion is:

;; The value of (A 2 4) is‚Ä¶

(A 2 4)
;Value: 65536

1 ]=> (A 1 (A 2 3))
;Value: 65536

1 ]=> (A 1 (A 1 (A 2 2)))
;Value: 65536

1 ]=> (A 1 (A 1 (A 1 (A 2 1))))
;Value: 65536

1 ]=> (A 1 (A 1 (A 1 2)))
;Value: 65536

1 ]=> (A 1 (A 1 (A 0 (A 1 1))))
;Value: 65536

1 ]=> (A 1 (A 1 (A 0 2)))
;Value: 65536

1 ]=> (A 1 (A 1 4))
;Value: 65536

1 ]=> (A 1 (A 0 (A 1 3)))
;Value: 65536

1 ]=> (A 1 (A 0 (A 0 (A 1 2))))
;Value: 65536

1 ]=> (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
;Value: 65536

1 ]=> (A 1 (A 0 (A 0 (A 0 2))))
;Value: 65536

1 ]=> (A 1 (A 0 (A 0 4)))
;Value: 65536

1 ]=> (A 1 (A 0 8))
;Value: 65536

1 ]=> (A 1 16)
;Value: 65536

1 ]=> (A 0 (A 1 15))
;Value: 65536

1 ]=> (A 0 (A 0 (A 1 14)))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 1 13))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 1 12)))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 11))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 10)))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 9))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 8)))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 7))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 6)))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 32)))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 64))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 128)))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 256))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 512)))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 1024))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 2048)))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 4096))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 8192)))
;Value: 65536

1 ]=> (A 0 (A 0 16384))
;Value: 65536

1 ]=> (A 0 32768)
;Value: 65536

1 ]=> 65536
;Value: 65536

1 ]=> ;; The value of (A 3 3) is‚Ä¶

(A 3 3)
;Value: 65536

1 ]=> (A 2 (A 3 2))
;Value: 65536

1 ]=> (A 2 (A 2 (A 3 1)))
;Value: 65536

1 ]=> (A 2 (A 2 2))
;Value: 65536

1 ]=> (A 2 (A 1 (A 2 1)))
;Value: 65536

1 ]=> (A 2 (A 1 2))
;Value: 65536

1 ]=> (A 2 (A 0 (A 1 1)))
;Value: 65536

1 ]=> (A 2 (A 0 2))
;Value: 65536

1 ]=> (A 2 4)
;Value: 65536

1 ]=> (A 1 (A 2 3))
;Value: 65536

1 ]=> (A 1 (A 1 (A 2 2)))
;Value: 65536

1 ]=> (A 1 (A 1 (A 1 (A 2 1))))
;Value: 65536

1 ]=> (A 1 (A 1 (A 1 2)))
;Value: 65536

1 ]=> (A 1 (A 1 (A 0 (A 1 1))))
;Value: 65536

1 ]=> (A 1 (A 1 (A 0 2)))
;Value: 65536

1 ]=> (A 1 (A 1 4))
;Value: 65536

1 ]=> (A 1 (A 0 (A 1 3)))
;Value: 65536

1 ]=> (A 1 (A 0 (A 0 (A 1 2))))
;Value: 65536

1 ]=> (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
;Value: 65536

1 ]=> (A 1 (A 0 (A 0 (A 0 2))))
;Value: 65536

1 ]=> (A 1 (A 0 (A 0 4)))
;Value: 65536

1 ]=> (A 1 (A 0 8))
;Value: 65536

1 ]=> (A 1 16)
;Value: 65536

1 ]=> (A 0 (A 1 15))
;Value: 65536

1 ]=> (A 0 (A 0 (A 1 14)))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 1 13))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 1 12)))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 11))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 10)))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 9))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 8)))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 7))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 6)))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 32)))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 64))))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 128)))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 256))))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 512)))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 1024))))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 (A 0 2048)))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 (A 0 4096))))
;Value: 65536

1 ]=> (A 0 (A 0 (A 0 8192)))
;Value: 65536

1 ]=> (A 0 (A 0 16384))
;Value: 65536

1 ]=> (A 0 32768)
;Value: 65536

1 ]=> 65536
;Value: 65536

1 ]=> ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Procedure:
(define (f n) (A 0 n))
;Value: f

1 ]=> ;; Evaluation:
(f n)
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify a value to use instead of n.
; (RESTART 2) => Define n to a given value.
; (RESTART 1) => Return to read-eval-print level 1.

2 error> (A 0 n)
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 4) => Specify a value to use instead of n.
; (RESTART 3) => Define n to a given value.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

3 error> (* 2 n)
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 5) => Specify a value to use instead of n.
; (RESTART 4) => Define n to a given value.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

4 error> ;; Mathematical expression:
;; f(n) = 2n

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Procedure:
(define (g n) (A 1 n))
;Value: g

4 error> ;; Evaluation:
(g n)
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 6) => Specify a value to use instead of n.
; (RESTART 5) => Define n to a given value.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

5 error> (A 1 n)
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 7) => Specify a value to use instead of n.
; (RESTART 6) => Define n to a given value.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

6 error> ;; expand like so (n - 1) times:
(A 0 (A 1 (- n 1)))
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 8) => Specify a value to use instead of n.
; (RESTART 7) => Define n to a given value.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

7 error> (A 0 (A 0 (A 1 (- (- n 1) 1))))
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 9) => Specify a value to use instead of n.
; (RESTART 8) => Define n to a given value.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

8 error> (A 0 (A 0 (A 0 (A 1 (- (- (- n 1) 1) 1)))))
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 10) => Specify a value to use instead of n.
; (RESTART 9) => Define n to a given value.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

9 error> ;; ‚Ä¶etc.
;; after expanding (n - 1) times, expression will be (A 1 1) preceeded by (n - 1) copies of "(A 0 ":
‚
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

10 error> Ä
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

11 error> ¶
;Unbound variable: |¬¶|
;To continue, call RESTART with an option number:
; (RESTART 13) => Specify a value to use instead of |¬¶|.
; (RESTART 12) => Define |¬¶| to a given value.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

12 error> (A 0 (A 0 (A 0 (A 1 1))))
;Value: 16

12 error> ;; reduce like so (n - 1) times:
‚
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

13 error> Ä
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

14 error> ¶
;Unbound variable: |¬¶|
;To continue, call RESTART with an option number:
; (RESTART 16) => Specify a value to use instead of |¬¶|.
; (RESTART 15) => Define |¬¶| to a given value.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

15 error> (A 0 (A 0 (A 0 2)))
;Value: 16

15 error> ‚
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

16 error> Ä
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

17 error> ¶
;Unbound variable: |¬¶|
;To continue, call RESTART with an option number:
; (RESTART 19) => Specify a value to use instead of |¬¶|.
; (RESTART 18) => Define |¬¶| to a given value.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

18 error> (A 0 (A 0 4))
;Value: 16

18 error> ‚
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

19 error> Ä
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

20 error> ¶
;Unbound variable: |¬¶|
;To continue, call RESTART with an option number:
; (RESTART 22) => Specify a value to use instead of |¬¶|.
; (RESTART 21) => Define |¬¶| to a given value.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

21 error> (A 0 8)
;Value: 16

21 error> ;; ‚Ä¶etc.
;; final answer will 2^n

;; Mathematical expression:
;; g(n) = 2^n

;; Example:
(g 3)
;Value: 8

21 error> (A 1 3)
;Value: 8

21 error> (A 0 (A 1 2))
;Value: 8

21 error> (A 0 (A 0 (A 1 1)))
;Value: 8

21 error> (A 0 (A 0 2))
;Value: 8

21 error> (A 0 4)
;Value: 8

21 error> 8
;Value: 8

21 error> ;; g(3) = 2^3 = 8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Procedure:
(define (h n) (A 2 n))
;Value: h

21 error> ;; Evaluation:
(h n)
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 23) => Specify a value to use instead of n.
; (RESTART 22) => Define n to a given value.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

22 error> (A 2 n)
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 24) => Specify a value to use instead of n.
; (RESTART 23) => Define n to a given value.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

23 error> ;; expand like so (n - 1) times:
(A 1 (A 2 (- n 1)))
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 25) => Specify a value to use instead of n.
; (RESTART 24) => Define n to a given value.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

24 error> (A 1 (A 1 (A 2 (- (- n 1) 1))))
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 26) => Specify a value to use instead of n.
; (RESTART 25) => Define n to a given value.
; (RESTART 24) => Return to read-eval-print level 24.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

25 error> (A 1 (A 1 (A 1 (A 2 (- (- (- n 1) 1) 1)))))
;Unbound variable: n
;To continue, call RESTART with an option number:
; (RESTART 27) => Specify a value to use instead of n.
; (RESTART 26) => Define n to a given value.
; (RESTART 25) => Return to read-eval-print level 25.
; (RESTART 24) => Return to read-eval-print level 24.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

26 error> ;; ‚Ä¶etc.
;; after expanding (n - 1) times, expression will be (A 2 1) preceeded by (n - 1) copies of "(A 1 ":
‚
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 26) => Return to read-eval-print level 26.
; (RESTART 25) => Return to read-eval-print level 25.
; (RESTART 24) => Return to read-eval-print level 24.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

27 error> Ä
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 27) => Return to read-eval-print level 27.
; (RESTART 26) => Return to read-eval-print level 26.
; (RESTART 25) => Return to read-eval-print level 25.
; (RESTART 24) => Return to read-eval-print level 24.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

28 error> ¶
;Unbound variable: |¬¶|
;To continue, call RESTART with an option number:
; (RESTART 30) => Specify a value to use instead of |¬¶|.
; (RESTART 29) => Define |¬¶| to a given value.
; (RESTART 28) => Return to read-eval-print level 28.
; (RESTART 27) => Return to read-eval-print level 27.
; (RESTART 26) => Return to read-eval-print level 26.
; (RESTART 25) => Return to read-eval-print level 25.
; (RESTART 24) => Return to read-eval-print level 24.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

29 error> (A 1 (A 1 (A 1 (A 2 1))))
;Value: 65536

29 error> ;; reduce like so (omitting intermediate steps by substituting mathematical definition of g(n) for (A 1 n)) (n - 1) times:
‚
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 29) => Return to read-eval-print level 29.
; (RESTART 28) => Return to read-eval-print level 28.
; (RESTART 27) => Return to read-eval-print level 27.
; (RESTART 26) => Return to read-eval-print level 26.
; (RESTART 25) => Return to read-eval-print level 25.
; (RESTART 24) => Return to read-eval-print level 24.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

30 error> Ä
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 30) => Return to read-eval-print level 30.
; (RESTART 29) => Return to read-eval-print level 29.
; (RESTART 28) => Return to read-eval-print level 28.
; (RESTART 27) => Return to read-eval-print level 27.
; (RESTART 26) => Return to read-eval-print level 26.
; (RESTART 25) => Return to read-eval-print level 25.
; (RESTART 24) => Return to read-eval-print level 24.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

31 error> ¶
;Unbound variable: |¬¶|
;To continue, call RESTART with an option number:
; (RESTART 33) => Specify a value to use instead of |¬¶|.
; (RESTART 32) => Define |¬¶| to a given value.
; (RESTART 31) => Return to read-eval-print level 31.
; (RESTART 30) => Return to read-eval-print level 30.
; (RESTART 29) => Return to read-eval-print level 29.
; (RESTART 28) => Return to read-eval-print level 28.
; (RESTART 27) => Return to read-eval-print level 27.
; (RESTART 26) => Return to read-eval-print level 26.
; (RESTART 25) => Return to read-eval-print level 25.
; (RESTART 24) => Return to read-eval-print level 24.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

32 error> (A 1 (A 1 (A 1 2)))
;Value: 65536

32 error> ‚
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 32) => Return to read-eval-print level 32.
; (RESTART 31) => Return to read-eval-print level 31.
; (RESTART 30) => Return to read-eval-print level 30.
; (RESTART 29) => Return to read-eval-print level 29.
; (RESTART 28) => Return to read-eval-print level 28.
; (RESTART 27) => Return to read-eval-print level 27.
; (RESTART 26) => Return to read-eval-print level 26.
; (RESTART 25) => Return to read-eval-print level 25.
; (RESTART 24) => Return to read-eval-print level 24.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

33 error> Ä
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 33) => Return to read-eval-print level 33.
; (RESTART 32) => Return to read-eval-print level 32.
; (RESTART 31) => Return to read-eval-print level 31.
; (RESTART 30) => Return to read-eval-print level 30.
; (RESTART 29) => Return to read-eval-print level 29.
; (RESTART 28) => Return to read-eval-print level 28.
; (RESTART 27) => Return to read-eval-print level 27.
; (RESTART 26) => Return to read-eval-print level 26.
; (RESTART 25) => Return to read-eval-print level 25.
; (RESTART 24) => Return to read-eval-print level 24.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

34 error> ¶
;Unbound variable: |¬¶|
;To continue, call RESTART with an option number:
; (RESTART 36) => Specify a value to use instead of |¬¶|.
; (RESTART 35) => Define |¬¶| to a given value.
; (RESTART 34) => Return to read-eval-print level 34.
; (RESTART 33) => Return to read-eval-print level 33.
; (RESTART 32) => Return to read-eval-print level 32.
; (RESTART 31) => Return to read-eval-print level 31.
; (RESTART 30) => Return to read-eval-print level 30.
; (RESTART 29) => Return to read-eval-print level 29.
; (RESTART 28) => Return to read-eval-print level 28.
; (RESTART 27) => Return to read-eval-print level 27.
; (RESTART 26) => Return to read-eval-print level 26.
; (RESTART 25) => Return to read-eval-print level 25.
; (RESTART 24) => Return to read-eval-print level 24.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

35 error> (A 1 (A 1 4))
;Value: 65536

35 error> ;; (A 1 2) = g(2) = 2^2 = 4
‚
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 35) => Return to read-eval-print level 35.
; (RESTART 34) => Return to read-eval-print level 34.
; (RESTART 33) => Return to read-eval-print level 33.
; (RESTART 32) => Return to read-eval-print level 32.
; (RESTART 31) => Return to read-eval-print level 31.
; (RESTART 30) => Return to read-eval-print level 30.
; (RESTART 29) => Return to read-eval-print level 29.
; (RESTART 28) => Return to read-eval-print level 28.
; (RESTART 27) => Return to read-eval-print level 27.
; (RESTART 26) => Return to read-eval-print level 26.
; (RESTART 25) => Return to read-eval-print level 25.
; (RESTART 24) => Return to read-eval-print level 24.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

36 error> Ä
;Illegal character: #\U+80
;To continue, call RESTART with an option number:
; (RESTART 36) => Return to read-eval-print level 36.
; (RESTART 35) => Return to read-eval-print level 35.
; (RESTART 34) => Return to read-eval-print level 34.
; (RESTART 33) => Return to read-eval-print level 33.
; (RESTART 32) => Return to read-eval-print level 32.
; (RESTART 31) => Return to read-eval-print level 31.
; (RESTART 30) => Return to read-eval-print level 30.
; (RESTART 29) => Return to read-eval-print level 29.
; (RESTART 28) => Return to read-eval-print level 28.
; (RESTART 27) => Return to read-eval-print level 27.
; (RESTART 26) => Return to read-eval-print level 26.
; (RESTART 25) => Return to read-eval-print level 25.
; (RESTART 24) => Return to read-eval-print level 24.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

37 error> ¶
;Unbound variable: |¬¶|
;To continue, call RESTART with an option number:
; (RESTART 39) => Specify a value to use instead of |¬¶|.
; (RESTART 38) => Define |¬¶| to a given value.
; (RESTART 37) => Return to read-eval-print level 37.
; (RESTART 36) => Return to read-eval-print level 36.
; (RESTART 35) => Return to read-eval-print level 35.
; (RESTART 34) => Return to read-eval-print level 34.
; (RESTART 33) => Return to read-eval-print level 33.
; (RESTART 32) => Return to read-eval-print level 32.
; (RESTART 31) => Return to read-eval-print level 31.
; (RESTART 30) => Return to read-eval-print level 30.
; (RESTART 29) => Return to read-eval-print level 29.
; (RESTART 28) => Return to read-eval-print level 28.
; (RESTART 27) => Return to read-eval-print level 27.
; (RESTART 26) => Return to read-eval-print level 26.
; (RESTART 25) => Return to read-eval-print level 25.
; (RESTART 24) => Return to read-eval-print level 24.
; (RESTART 23) => Return to read-eval-print level 23.
; (RESTART 22) => Return to read-eval-print level 22.
; (RESTART 21) => Return to read-eval-print level 21.
; (RESTART 20) => Return to read-eval-print level 20.
; (RESTART 19) => Return to read-eval-print level 19.
; (RESTART 18) => Return to read-eval-print level 18.
; (RESTART 17) => Return to read-eval-print level 17.
; (RESTART 16) => Return to read-eval-print level 16.
; (RESTART 15) => Return to read-eval-print level 15.
; (RESTART 14) => Return to read-eval-print level 14.
; (RESTART 13) => Return to read-eval-print level 13.
; (RESTART 12) => Return to read-eval-print level 12.
; (RESTART 11) => Return to read-eval-print level 11.
; (RESTART 10) => Return to read-eval-print level 10.
; (RESTART 9) => Return to read-eval-print level 9.
; (RESTART 8) => Return to read-eval-print level 8.
; (RESTART 7) => Return to read-eval-print level 7.
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

38 error> (A 1 16)
;Value: 65536

38 error> ;; (A 1 4) = g(4) = 2^4 = 16
;; ‚Ä¶etc.
;; the final answer will be 2^^n (that's "2 double arrow n", or tetration‚Äîgood thing Adam showed me arrow notation in calculus!)

;; h(n) = ‚Ä¶g(g(g(2)))‚Ä¶ (where g is recursively applied (n - 1) times to 2)
;; h(n) = ‚Ä¶2^(2^(2^2))
;; h(n) = 2^^n

;; Example:
(h 3)
;Value: 16

38 error> (A 2 3)
;Value: 16

38 error> (A 1 (A 2 2))
;Value: 16

38 error> (A 1 (A 1 (A 2 1)))
;Value: 16

38 error> (A 1 (A 1 2))
;Value: 16

38 error> (A 1 4)
;Value: 16

38 error> ;; (A 1 2) = g(2) = 2^2 = 4
16
;Value: 16

38 error> ;; (A 1 4) = g(4) = 2^4 = 16
;; h(3) = 2^^3 = 2^2^2 = 16

;; And another example, just to show how ridiculously fast this grows:
(h 4)
;Value: 65536

38 error> (A 2 4)
;Value: 65536

38 error> (A 1 (A 2 3))
;Value: 65536

38 error> (A 1 (A 1 (A 2 2)))
;Value: 65536

38 error> (A 1 (A 1 (A 1 (A 2 1)))
(A 1 (A 1 (A 1 2)))
(A 1 (A 1 4)) ;; (A 1 2) = g(2) = 2^2 = 4
(A 1 16) ;; (A 1 4) = g(4) = 2^4 = 16
65536 ;; (A 1 16) = g(16) = 2^16 = 65536
;; h(4) = 2^^4 = 2^2^2^2 = 65536

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Note that‚Ä¶

;; (A 0 n) = 2n = 2(0 arrows)n
;; (A 1 n) = 2^n = 2(1 arrow)n
;; (A 2 n) = 2^^n = 2(2 arrows)n

;; In general, it looks like (A x n) is 2(x arrows)n. Crazy.
End of input stream reached.
Moriturus te saluto.
