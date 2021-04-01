`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 12:06:14 PM
// Design Name: 
// Module Name: Shifter_TB
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


module Shifter_TB();
reg[4:0] SH;
reg[31:0] A;
wire[31:0] F;
Shifter uut(
.SH(SH),
.A(A),
.F(F)
);
initial begin
    SH = 6'd3;
    A = 5'b10000;
end
endmodule
