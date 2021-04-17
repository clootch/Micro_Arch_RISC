`timescale 1ns / 1ps

module Instruction_Memory(
    input clk,
    input [31:0] PC,
    output reg [31:0] IR
    );
    
    //Program Memory:
    initial IR = 0;
    
    always@ (posedge clk) begin
        case (PC)/*
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
        endcase
    end
    
    
    
endmodule
