`timescale 1ns / 1ps

module WB(
    input RW,
    input DA,
    input [1:0] MD,
    input [31:0] F,
    input NV,
    input [31:0] DATA,
    input clk,
    output RW_o,
    output DA_o,
    output [31:0] BUS_D
    );
    
    
    assign RW_o = RW;
    assign DA_o = DA;
    
    assign BUS_D = (MD==2'b00) ? 
        F : (MD==2'b01) ? 
            DATA : 32'b0;
    
endmodule
