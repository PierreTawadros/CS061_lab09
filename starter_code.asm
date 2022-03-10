.orig x3000
;this stack lab computes the polish notation of a set of calls
LD R6, stack_adr
;push_val(4) pushes the value 4 onto the stack [4]
ADD R1, R0, #4
LD R2, push_val
JSRR R2
;push_val(3) pushes the value 3 onto the stack [4,3]
ADD R1, R0, #3
LD R2, push_val
JSRR R2

;push_val(2) pushes the value 2 onto the stack [4,3,2]
ADD R1, R0, #2
LD R2, push_val
JSRR R2


;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
LD R2, add_val
JSRR R2


;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
LD R2, add_val
JSRR R2



;move the top value of the stack into r4
LDR R4, R6, #0
halt
stack_adr   .fill x4200
push_val    .fill x3400
add_val     .fill x3800
.end





.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack
ST R7, SAVE_7_

ADD R6, R6, #1
STR R1, R6, #0

LD R7, SAVE_7_
ret
SAVE_7_  .blkw #1
.end
.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack
ST R7, SAVE_7
ST R2, SAVE_2
ST R3, SAVE_3

LDR R2, R6, #0
ADD R6, R6, #-1
LDR R3, R6, #0
ADD R2, R2, R3
STR R2, R6, #0

LD R7, SAVE_7
LD R2, SAVE_2
LD R3, SAVE_3

ret
SAVE_7  .blkw #1
SAVE_2  .blkw #1
SAVE_3  .blkw #1
.end


.orig x4200 ;;data you might need
.blkw   #100
.end


