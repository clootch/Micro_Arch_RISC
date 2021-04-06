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
reg[1:0] direction;
wire[31:0] shiftOut;
Shifter uut(
.direction(direction),
.SH(SH),
.A(A),
.shiftOut(shiftOut)
);
initial begin
    direction = 2'b10;
    SH = 6'd3;
    A = 5'b10000;
    #10;
    A = 32'b11111111111111111111110001;
    SH = 6'd7;
    #5;
    direction = 2'b11;
    
end
endmodule
