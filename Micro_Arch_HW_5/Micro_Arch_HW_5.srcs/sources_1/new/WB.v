`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2021 05:20:41 PM
// Design Name: 
// Module Name: WB
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


module WB(
    input RW,
    input DA,
    input [1:0] MD,
    input [31:0] F,
    input NV,
    input [31:0] M,
    input clk
    );
    
    always @ (posedge clk)
    begin
        
    end
    
endmodule
