; Exercise 1.2: Translate the following expression into prefix form:
; (5 + 4 + (2 - 3 - (6 + 4/5))) / (3(6 - 2)(2 - 7))

; had trouble deciding where to put the line breaks here
(/ (+ 5
      4
      (- 2 3 (+ 6 (/ 4 5))))
   (* 3
      (- 6 2)
      (- 2 7)))