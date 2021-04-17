; decide regs for numbers
; reg[1] = input operand A
; reg[2] = input operand B 
; reg[4:3] = output product Z=A*B
; reg[5] = Sign(A) = A[31]
; reg[6] = Sign(B) = B[31]
; reg[7] = final_sign = reg[5] XOR reg[6]
; reg[8] = P = A[top] 
; reg[9] = Q = A[bot] 
; reg[10] = R = B[top]
; reg[11] = S = B[bot]
; reg[12] = wordmask = {16'b0, 16'b1}
; reg[13] = himask = {16'b1, 16'b0}
; REGS FOR MUL LOOP
; 

;move vals into reg
adi r1, r0, A 
adi r2, r0, B 

;store signs
ani r5, r1, {1, 31'b0}
lsr r5, r5, 31
ani r6, r2, {1, 31'b0}
lsr r6, r6, 31

;calculate final sign
xor r7, r5, r6

;set word mask
adi r12, r0, {16'b0, 16'b1}
adi r13, r0, {16'b1, 16'b0}

;calc PQRS
and r8, r1, r13
and r9, r1, r12
and r10, r2, r13
and r11, r2, r12

;===============

;Q*S
;load operands for mul loop Q*S
mov r29, r9
mov r30, r11

;we wanna come back lol
adi r14, r0, [THIS LINE_1]

;go to loop
jmp MUL_LOOP

;move Q*S to r15
mov r15, r28

;=====================

;Q*R
;load operands for mul loop Q*S
mov r29, r9
mov r30, r10

;we wanna come back lol
adi r14, r0, [THIS LINE+1]

;go to loop
jmp MUL_LOOP

;move Q*S to r15
mov r16, r28

;=====================

;P*S
;load operands for mul loop P*S
mov r29, r8
mov r30, r11

;we wanna come back lol
adi r14, r0, [THIS LINE+1]

;go to loop
jmp MUL_LOOP

;move P*S to r17
mov r17, r28

;=====================

;combine products to get answer




;MUL_LOOP 😊😊😊

;r31 = count
;r29 = m
;r30 = n
;r28 = product

    ;if m empty, yeet
    add r0, r29, r0
    jz STORE_VAL
    
    ;compare bottom bit of m
    ani r27, r29, 1

    ;if r27 == 0, jmp SKIP_ADD
    ;else
    add r28, r28, r30

;SKIP ADD
    lsl r30, r30, 1
    lsr r29, r29, 1
    jmp MUL_LOOP
    
;STORE_VAL
    jmr r14