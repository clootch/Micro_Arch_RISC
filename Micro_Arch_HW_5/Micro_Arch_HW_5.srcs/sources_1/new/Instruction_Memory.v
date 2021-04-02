`timescale 1ns / 1ps

module Instruction_Memory(
    input clk,
    input [31:0] PC,
    output reg [6:0] opcode
    );
    
    //Program Memory:
    initial opcode = 0;
    
    always@ (posedge clk) begin
        case (PC)
            1: opcode = 0000010; //Add
        endcase
    end
    
    
    
endmodule
