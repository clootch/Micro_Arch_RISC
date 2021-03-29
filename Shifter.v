`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 11:56:35 AM
// Design Name: 
// Module Name: Shifter
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


module Shifter(
    input[4:0] SH,
    input[31:0] A,
    output[31:0] F
    );
    assign F = A>>SH | A<<(6'd32-SH);
endmodule
