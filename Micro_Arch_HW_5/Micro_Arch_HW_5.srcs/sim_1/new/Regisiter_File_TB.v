`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2021 02:03:57 PM
// Design Name: 
// Module Name: Regisiter_File_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Regisiter_File_TB();
    reg[4:0] AA;
    reg[4:0] BA;
    reg[4:0] DA;
    reg RW;
    reg clk;
    reg[31:0] D;
    wire[31:0] A;
    wire[31:0] B;
    Register_File uut(
    .AA(AA),
    .BA(BA),
    .DA(DA),
    .RW(RW),
    .clk(clk),
    .D(D),
    .A(A),
    .B(B)
    );
    
    initial begin
        clk = 0;
        AA = 5'b1;
        BA = 5'b1;
        #10;
        D= 31'd32;
        RW = 0;
        #10;
        RW = 1;
        DA = 4;
        #10;
        AA = 5'd2;
        BA = 5'd5;
    end
    always
    begin
        #10;
        clk = ~clk;
    end
endmodule
