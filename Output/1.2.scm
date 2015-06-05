MIT/GNU Scheme running under OS X
Type `^C' (control-C) followed by `H' to obtain information about interrupts.

Copyright (C) 2014 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Tuesday June 2, 2015 at 12:20:18 AM
  Release 9.2 || Microcode 15.3 || Runtime 15.7 || SF 4.41 || LIAR/C 4.118
  Edwin 3.116

1 ]=> ; Exercise 1.2: Translate the following expression into prefix form:
; (5 + 4 + (2 - 3 - (6 + 4/5))) / (3(6 - 2)(2 - 7))

; had trouble deciding where to put the line breaks here
(/ (+ 5
      4
      (- 2 3 (+ 6 (/ 4 5))))
   (* 3
      (- 6 2)
      (- 2 7)))
;Value: -1/50

1 ]=> 
End of input stream reached.
Moriturus te saluto.
