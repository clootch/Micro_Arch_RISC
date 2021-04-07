`timescale 1ns / 1ps

module WB(
    input RW,
    input [4:0] DA,
    input [1:0] MD,
    input [31:0] F,
    input NV,
    input [31:0] DATA,
    input clk,
    output [4:0] DA_o,
    output RW_o,
    output [31:0] BUS_D
    );
    
    assign BUS_D = (MD==2'b00) ? 
        F : (MD==2'b01) ? 
            DATA : {31'b0, NV};
    
    assign DA_o = DA;
    assign RW_o = RW;
endmodule
