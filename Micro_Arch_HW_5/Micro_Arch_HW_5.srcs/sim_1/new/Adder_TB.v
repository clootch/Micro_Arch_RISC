`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 11:28:35 AM
// Design Name: 
// Module Name: Adder_TB
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


module Adder_TB();
reg[31:0] PC;
reg [31:0] B;
wire[31:0] BrA;
Adder uut(
.PC(PC),
.B(B),
.BrA(BrA));

initial begin
   PC = 32'd123;
   B = 32'd5; 
   #10;
   PC = 32'd145;
   B = 32'd1;
end
endmodule
