; ===================================
; decide regs for numbers
; reg[0] = constant 0
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
; reg[14] = SP
; reg[15] = combination working reg, "purple"
; reg[16] = SPQR
; reg[17] = P*S
; reg[18] = Q*R
; reg[19] = Addition Condition
; reg[20] = Special Word Mask
; reg[21] = Checker for special Add Case
; reg[22] = Checker for special Add Case
; reg[23] = single bit mask
; reg[24] = MUL_LOOP PC 
; reg[25] = working reg
; reg[26] = empty
; reg[27] = working reg
; reg[28] = working reg
; reg[29] = working reg
; reg[30] = working reg
; reg[31] = empty
; REGS FOR MUL LOOP
; ===================================

;move vals into reg
adi r1, r0, A 
adi r2, r0, B 

adi r24, r0, IM ;MUL_LOOP PC

;set single bit mask
adi r23, r0, 1
lsl r23, r23, 31

;store signs
and r5, r1, r23 ;IM limited to 14 bits
and r6, r2, r23

;calculate final sign
xor r7, r5, r6

;set word mask
;adi r12, r0, {16'b0, 16'b1111111111111111} ;needs to be changed
adi r12, r0, 14'b11111111111111 
lsl r12, r12, 2
adi r12, r0, 2'b11
;set hi mask
lsl r13, r12, 16


;Two's Complement any negatives
;==============================

bz r5(SA), se IM ;check B sign

;Two's Comp of A
not r1, r1
adi r1, r1, 1

bz r6(SA), se IM ;Skip compl 

;Two's Comp of B
NOT r2, r2 
ADI r2, r2, 1

;==============================

;calc PQRS
and r8, r1, r13  ; P (Higher half of A)
lsr r8, r8, 16;
and r9, r1, r12  ; Q (Lower half of A)
and r10, r2, r13 ; R (Higher half of B)
lsr r10, r10, 16;F
and r11, r2, r12 ; S (Lower half of B)

;===============

;Q*S (Should be in the lower half of the number)
;load operands for mul loop Q*S
mov r29, r9
mov r30, r11

;we wanna come back lol
adi r14, r0, [THIS LINE_1]

;go to loop
jmr r24 ;RELATIVE jump

;move Q*S to r15
mov r4, r28
;Only Possible number that would be in the lower half of the number, so just store it


;=====================

;P*R (Should be in the higher half of the number)
;load operands for mul loop
mov r29, r8
mov r30, r10

;we wanna come back lol
adi r14, r0, [THIS LINE+1] ;nop after jmr

;go to loop
jmr r24

;move P*R to r16
mov r3, r28

;=====================
;new reg for intermed: r15
;clone top of Q*S into new reg bottom
and r15, r4, r13
lsr r15, r15, 16
;clone bottom of P*R into new reg top
and r25, r3, r12
lsl r25, r25, 16
;combine bottom of P*R and top of Q*S
add r15, r25, r15

;=====================

;P*S (Should be in the higher half of the number)
;load operands for mul loop P*S
mov r29, r8
mov r30, r11

;we wanna come back lol
adi r14, r0, [THIS LINE+1]

;go to loop
jmr r24

;move P*S to r17
mov r17, r28

;=====================
;=====================

;Q*R (Should be in the higher half of the number)
;load operands for mul loop P*S
mov r29, r9
mov r30, r10

;we wanna come back lol
adi r14, r0, [THIS LINE+1]

;go to loop
jmr r24

;move P*S to r17
mov r18, r28

;=====================

;combine PS and QR
;PS+QR
add r16, r17, r18 ;CAN OVERFLOW (if C add 1 to presign r3)

;add SPQR to "purple"
add r15, r16, r15

;low half purple into working reg with 0s
and r16, r12, r15 
lsl r16, r16, 16

;clear space in final reg
and r3, r13, r3
and r4, r12, r4

;high half purple into working reg with 0s
and r15, r13, r15
lsr r15, r15, 16
;move parts into final position
add r3, r3, r15
add r4, r16, r4

;add sign :D 
;is sign positive
bz r7 NARNIA

;r4 is 0?
bz r4

;bit flip, add one
not r4, r4
adi r4, r4, 1
not r3, r3
jmp NARNIA

;r4 is all 0, but we need to 2s compl
not r3, r3
add r3, r3, 1

;NARNIA
jmp here


;MUL_LOOP ????????????

;r31 = count
;r29 = m
;r30 = n
;r28 = product

    ;if m empty, yeet
    jz r29;RELATIVE STORE_VAL
    
    ;compare bottom bit of m
    ani r27, r29, 1
    ;if r27 == 0, jmp SKIP_ADD
    jz r27 ;SKIP_ADD
    
    ;else
    add r28, r28, r30

;SKIP ADD
    lsl r30, r30, 1
    lsr r29, r29, 1
    jmr r24
    
;STORE_VAL
    jmr r14
	
	
;Special Land :)
??????????????????????????????????????????????????????????????????????????????????????????????
