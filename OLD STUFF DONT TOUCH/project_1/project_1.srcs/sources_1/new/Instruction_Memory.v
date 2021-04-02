`timescale 1ns / 1ps

module Instruction_Memory(
    input clk,
    input [31:0] PC,
    output reg [31:0] IR
    );
    
    //Program Memory:
    initial IR = 0;
    
    always@ (posedge clk) begin
        case (PC)
            //      Opcode  DR    SA   SB/Imme/offset
             0: IR = 32'b0000000_00000_00000_00000_0000000000; //Nop
             1: IR = 32'b0000010_00000_00000_00000_0000000000; //Add
             2: IR = 32'b0000101_00000_00000_00000_0000000000; //Sub
             3: IR = 32'b1100101_00000_00000_00000_0000000000; //SLT
             4: IR = 32'b0001000_00000_00000_00000_0000000000; //AND
             5: IR = 32'b0001010_00000_00000_00000_0000000000; //OR
             6: IR = 32'b0001100_00000_00000_00000_0000000000; //XOR
             7: IR = 32'b0000001_00000_00000_00000_0000000000; //ST
             8: IR = 32'b0100001_00000_00000_00000_0000000000; //LD
             9: IR = 32'b0100010_00000_00000_00000_0000000000; //ADI
            10: IR = 32'b0100101_00000_00000_00000_0000000000; //SBI
            11: IR = 32'b0101110_00000_00000_00000_0000000000; //Not
            12: IR = 32'b0101000_00000_00000_00000_0000000000; //ANI
            13: IR = 32'b0101010_00000_00000_00000_0000000000; //ORI
            14: IR = 32'b0101100_00000_00000_00000_0000000000; //XRI
            15: IR = 32'b1100010_00000_00000_00000_0000000000; //AIU
            16: IR = 32'b1000101_00000_00000_00000_0000000000; //SIU
            17: IR = 32'b1000000_00000_00000_00000_0000000000; //MOV
            18: IR = 32'b0110000_00000_00000_00000_0000000000; //LSL
            19: IR = 32'b0110001_00000_00000_00000_0000000000; //LSR
            20: IR = 32'b1100001_00000_00000_00000_0000000000; //JMR
            21: IR = 32'b0100000_00000_00000_00000_0000000000; //BZ
            22: IR = 32'b1100000_00000_00000_00000_0000000000; //BNZ
            23: IR = 32'b1000100_00000_00000_00000_0000000000; //JMP
            24: IR = 32'b0000111_00000_00000_00000_0000000000; //JML
        endcase
    end
    
    
    
endmodule
