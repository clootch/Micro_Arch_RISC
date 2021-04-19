`timescale 1ns / 1ps

module Instruction_Memory(
    input clk,
    input [31:0] PC,
    output reg [31:0] IR
    );
    
    //Program Memory:
    initial IR = 0;
    
    always@ (posedge clk) begin
        /*case (PC)
            //           Opcode  DR    SA   SB/Imme/offset
             0: IR = 32'b0000000_00000_00000_00000_0000000000; //Nop
             2: IR = 32'b0000010_00101_00001_00010_0000000000; //Add 4 + (-5) = -1
             5: IR = 32'b0000101_00110_00011_00100_0000000000; //Sub 1001 - (-4350) = 5351
             8: IR = 32'b1100101_00100_00010_00001_0000000000; //SLT if -5 < 4: r[4] = 1
            11: IR = 32'b0001000_01001_00111_01000_0000000000; //AND r[9]=00100
            14: IR = 32'b0001010_01001_00111_01000_0000000000; //OR  r[9] = 11111
            17: IR = 32'b0001100_01001_00111_01000_0000000000; //XOR r[9] = 11011
            20: IR = 32'b0000001_00000_01010_00110_0000000000; //ST  store M[500]=5351
            23: IR = 32'b0100001_01001_01010_00000_0000000000; //LD  r[9] = M[500]=5351
            26: IR = 32'b0100010_01001_00001_01100_1101010110; //ADI r[9] = 13146
            29: IR = 32'b0100101_01001_00001_01100_1101010110; //SBI r[9] = -13138
            32: IR = 32'b0101110_01001_00111_00000_0000000000; //NOT r[9] = 01010
            35: IR = 32'b0101000_01001_00111_00000_0000000001; //ANI r[9] = 00001
            38: IR = 32'b0101010_01001_00111_00000_0000011111; //ORI r[9] = 11111
            41: IR = 32'b0101100_01001_00111_00000_0000011001; //XRI r[9] = 01100
            44: IR = 32'b1100010_01001_00001_01100_1101010110; //AIU r[9] = 13146
            47: IR = 32'b1000101_01001_00001_01100_1101010110; //SIU r[9] = -13138
            50: IR = 32'b1000000_01001_00111_00000_0000000000; //MOV r[9] = 10101
            53: IR = 32'b0110000_01001_00111_00000_0000000011; //LSL it works lol
            56: IR = 32'b0110001_01001_00111_00000_0000000011; //LSR "
            59: IR = 32'b1100001_00000_01111_00000_0000000000; //JMR dis work
            72: IR = 32'b0100000_00000_00000_00000_0000000011; //BZ  dis work
            78: IR = 32'b1100000_00000_00001_00000_0000000000; //BNZ dis work
            81: IR = 32'b1000100_00000_00000_00000_0000000000; //JMP //this works
            84: IR = 32'b0000111_01001_00000_00000_0000000000; //JML
       default: IR = 32'b0; //NOP
        endcase*/
        case (PC)
           //           Opcode  DR    SA   SB/Imme/offset
              0: IR = 32'b0100010_00001_00000_00000_0000000010; //adi r1,  r0,  A 
              2: IR = 32'b0100010_00010_00000_00000_0000000011; //adi r2,  r0,  B 
              5: IR = 32'b0100010_11000_00000_00000_0000000011; //ADD MUL_PC LINE
			  8: IR = 32'b0100010_10111_00000_00000_0000000001; //adi r23, r0,  1
			 11: IR = 32'b0110000_10111_10111_00000_0000011111; //lsl r23, r23, 31
			 14: IR = 32'b0001000_00101_00001_10111_0000000000; //and r5,  r1,  r23 
			 17: IR = 32'b0001000_00110_00010_10111_0000000000; //and r6,  r2,  r23
			 20: IR = 32'b0001100_00111_00101_00110_0000000000; //xor r7,  r5,  r6
			 23: IR = 32'b0100010_01100_00000_01111_1111111111; //adi r12, r0,  14'b1's 
			 26: IR = 32'b0110000_01100_01100_00000_0000000010; //lsl r12, r12, 2
			 29: IR = 32'b0100010_01100_00000_00000_0000000011; //adi r12, r0,  2'b11 
			 32: IR = 32'b0100010_01101_01100_00000_0000010000; //lsl r13, r12, 16
			 35: IR = 32'b0100000_00000_00101_00000_0000000000; //bz  r5,  ENTER POST TWOS COMP OF A
			 38: IR = 32'b0101110_00001_00001_00000_0000000000; //not r1,  r1
			 41: IR = 32'b0100010_00001_00001_00000_0000000001; //adi r1,  r1,  1
			 44: IR = 32'b0100000_00000_00110_00000_0000000000; //bz  r6, ENTER POST TWOS COMP
			 47: IR = 32'b0101110_00010_00010_00000_0000000000; //not r2,  r2
			 50: IR = 32'b0100010_00010_00010_00000_0000000001; //adi r2,  r2,  1
			 53: IR = 32'b0001000_01000_00001_01101_0000000000; //and r8,  r1,  r13
			 56: IR = 32'b0001000_01001_00001_01100_0000000000; //and r9,  r1,  r12
			 59: IR = 32'b0001000_01010_00010_01101_0000000000; //and r10, r2,  r13
			 62: IR = 32'b0001000_01011_00010_01100_0000000000; //and r11, r2,  r12
			 65: IR = 32'b1000000_11101_01001_00000_0000000000; //mov r29, r9
			 68: IR = 32'b1000000_11110_01011_00000_0000000000; //mov r30, r11
			 71: IR = 32'b0100010_01110_00000_00000_0000000000; //adi r14, r0,  ENTER MUL LOOP HERE
			 74: IR = 32'b1100001_00000_01110_00000_0000000000; //jmr r14
			 77: IR = 32'b1000000_00100_11100_00000_0000000000; //mov r4,  r28
			 80: IR = 32'b1000000_11101_01000_00000_0000000000; //mov r29, r8 
			 83: IR = 32'b1000000_11110_01010_00000_0000000000; //mov r30, r10
			 86: IR = 32'b0100010_01110_00000_00000_0000000000; //adi r14, r0,  ENTER MUL LOOP HERE
			 89: IR = 32'b1100001_00000_11000_00000_0000000000; //jmr r24
			 92: IR = 32'b1000000_00011_11100_00000_0000000000; //mov r3,  r28
			 95: IR = 32'b0001000_01111_00100_01101_0000000000; //and r15, r4,  r13
			 98: IR = 32'b0001000_01000_00011_01100_0000000000; //and r8,  r3,  r12
			101: IR = 32'b0001000_01111_01000_01111_0000000000; //and r15, r8,  r15
			104: IR = 32'b1000000_11101_01000_00000_0000000000; //mov r29, r8
			107: IR = 32'b1000000_11110_01011_00000_0000000000; //mov r30, r11
			110: IR = 32'b0100010_01110_00000_00000_0000000000; //adi r14, r0,  ENTER MUL LOOP HERE
			113: IR = 32'b1100001_00000_11000_00000_0000000000; //jmr r24
			116: IR = 32'b1000000_10001_11100_00000_0000000000; //mov r17, r28
			119: IR = 32'b1000000_11101_01001_00000_0000000000; //mov r29, r9 
			122: IR = 32'b1000000_11110_01010_00000_0000000000; //mov r30, r10
			125: IR = 32'b0100010_01110_00000_00000_0000000000; //adi r14, r0,  ENTER MUL LOOP HERE
			128: IR = 32'b1100001_00000_11000_00000_0000000000; //jmr r24
			131: IR = 32'b1000000_10010_11100_00000_0000000000; //mov r18, r28 
			134: IR = 32'b0000010_10000_10001_10010_0000000000; //add r16, r17, r18
			137: IR = 32'b0000010_01111_10001_01111_0000000000; //add r15, r16, r15
			140: IR = 32'b0001000_10000_01100_01111_0000000000; //and r16, r12, r15
			143: IR = 32'b0001000_00011_01100_00011_0000000000; //and r3,  r12, r3
			146: IR = 32'b0001000_00100_01101_00100_0000000000; //and r4,  r13, r4
			149: IR = 32'b0001000_01111_01101_01111_0000000000; //and r15, r13, r15
			152: IR = 32'b0000010_00100_00100_10000_0000000000; //add r4,  r4,  r16
	   default: IR = 32'b0; //NOP
        endcase
    end
    
    
    
endmodule
