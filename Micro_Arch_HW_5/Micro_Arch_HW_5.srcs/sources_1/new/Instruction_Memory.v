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
            1: IR = 32'b0000010_00000_00000_00000_0000000000; //Add
        endcase
    end
    
    
    
endmodule
